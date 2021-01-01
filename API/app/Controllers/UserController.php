<?php
namespace App\Controllers;

use Config\App;

class UserController extends Origin001
{
    protected $format = 'json';

    protected $mst_user_table;
    protected $prg_token;

    public function initController( \CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger )
    {

        // Do Not Edit This Line
        parent::initController( $request, $response, $logger );

        //--------------------------------------------------------------------
        // Preload any models, libraries, etc, here.
        //--------------------------------------------------------------------
        // E.g.:
        // $this->session = \Config\Services::session();

        $this->mst_user_table = $this->db->table( 'mst_user' );
        $this->prg_token      = $this->db->table( 'prg_token' );
    }

    public function login() {

        $data = $this->request->getJSON();

        $headers = [];
        foreach ( getallheaders() as $name => $value ) {
            $headers[$name] = $value;
        }

        //init data
        $token = '';

        $dataDB['status']  = "error";
        $dataDB['message'] = "";
        $dataDB['data']    = "";

        //Get Data From Post
        $user_login    = isset( $data->user_login ) ? $data->user_login : '';
        $user_password = isset( $data->user_password ) ? $data->user_password : '';

        $sql = "SELECT * FROM mst_user WHERE login_id = :login: AND active_flag = true";

        $query = $this->db->query( $sql, ['login' => $user_login] );
        $row   = $query->getRow();

        if ( !isset( $row ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "ไม่สามารถเข้าใช้งานระบบได้ login หรือ password ผิดพลาด";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        //$my = $this->encryption->decrypt($row['staff_pwd']);
        //if ($user_password == $this->encryption->decrypt($row['staff_pwd'])) {

        $nowData   = strtotime( date( "Y-m-d H:i:s" ) );
        $diff_time = round( abs( $nowData - strtotime( $row->last_ng_time ) ) / 60, 2 );

        if ( $row->ng_count >= MAX_LOGIN_COUNT && $diff_time <= MAX_LOCK_LOGIN_TIME_MINIUS ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = 'คุณ login เกินจำนวนครั้งที่กำหนด กรุณาลองใหม่อีกครั้งหลังผ่าน ' . MAX_LOCK_LOGIN_TIME_MINIUS . ' นาที';
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        if ( $user_password != $row->user_password ) {
            $user_update = [
                'last_ng_time' => date( "Y-m-d H:i:s" ),
                'update_date'  => date( "Y-m-d H:i:s" ),
                'ng_count'     => $row->ng_count + 1,
            ];
            $this->mst_user_table->where( 'user_id', $row->user_id );
            $this->mst_user_table->update( $user_update );

            $dataDB['status']  = "error";
            $dataDB['message'] = "ไม่สามารถเข้าใช้งานระบบได้ login หรือ password ผิดพลาด";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        $token = $this->_getGUID();

        $staff_id = $row->user_id;

        //Clear Old Token Data
        $data = ['active_flag' => false];
        $this->prg_token->where( ['user_id' => $staff_id, 'active_flag' => false] );
        $this->prg_token->update( $data );

        //insert New Token Data
        $TokenData['user_id']     = $staff_id;
        $TokenData['token_code']  = $token;
        $TokenData['active_flag'] = true;
        $TokenData['create_date'] = date( "Y-m-d H:i:s" );
        $this->prg_token->insert( $TokenData );

        //update user table
        $data = [
            'update_date'     => date( "Y-m-d H:i:s" ),
            'last_login_time' => date( "Y-m-d H:i:s" ),
            'last_ng_time'    => null,
            'ng_count'        => 0,
        ];
        $this->mst_user_table->where( 'user_id', $row->user_id );
        $this->mst_user_table->update( $data );

        //Get Menu Data
        $sql = "
        SELECT sm.*,mmp.permission_flag
        FROM mst_menu_permission mmp inner join sys_menu sm on mmp.menu_id  =  sm.menu_id
        WHERE mmp.user_group_id = :user_group_id:";

        $menu_data = $this->db->query( $sql, ['user_group_id' => $row->user_group_id] )->getResult();

        $result['token']     = $token;
        $result['user_name'] = $row->first_name . ' ' . $row->last_name;

        $dataDB['status']   = "success";
        $dataDB['message']  = "";
        $dataDB['data']     = $result;
        $dataDB['menuData'] = $menu_data;

        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );

    }

    private function _getGUID() {
        mt_srand( (double) microtime() * 10000 ); //optional for php 4.2.0 and up.
        $charid = strtoupper( md5( uniqid( rand(), true ) ) );
        $hyphen = chr( 45 ); // "-"
        $uuid   = substr( $charid, 0, 8 )
        . substr( $charid, 8, 4 )
        . substr( $charid, 12, 4 )
        . substr( $charid, 16, 4 )
        . substr( $charid, 20, 12 ); // "}"

        return $uuid;
    }

        /**
     * delete data by id
     */
    public function delete_data_by_id() {
        $data      = $this->request->getJSON();
        $http_code = 200;

        //init data
        $token     = $this->getAuthHeader();
        $user_id   = isset( $data->user_id ) ? $data->user_id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $insert_data['active_flag'] = false;
        $insert_data['update_date'] = date( "Y-m-d H:i:s" );
        $insert_data['update_user'] = $result->user_id;

        $this->mst_user_table->update( $insert_data, ['user_id' => $user_id] );

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        return $this->respond( $dataDB, $http_code );
    }

        /**
     * get data by id
     */
    public function get_data_by_id() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        $http_code = 200;

        //init data
        $user_id = isset( $data->userId ) ? $data->userId : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT mst_user.*
        FROM mst_user
        WHERE user_id = :user_id:
            AND active_flag = true
        ";

        $itemn_data = $this->db->query( $query_str, ['user_id' => $user_id] )->getRow();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = $query_str;
        $dataDB['data']    = $itemn_data;

        return $this->respond( $dataDB, $http_code );
    }

    private function _getCond( $s ) {
        $strCond = "";
        $params  = [];

        foreach ( $s as $key => $val ) {

            if ( $val == "" ) {
                continue;
            }

            switch ( $key ) {
                //case "example":
                //        $strCond .= "(example == false OR example IS NULL) \n";    // placeholders
                //        //$params["{$key}"] = "%{$val}%";                        // bindParam
                //    break;
                //case "start_date":
                //        $strCond .= "start_date >= :{$key} AND \n";    // placeholders
                //        $params["{$key}"] = "%{$val}%";                // bindParam
                //    break;
                //case "name":
                //        $strCond .= "name like :{$key} AND \n";        // placeholders
                //        $params["{$key}"] = "%{$val}%";                // bindParam
                //    break;

                case "name":
                    $strCond .= " LOWER(first_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "rowsPerpage":
                case "page_index":
                case "sort":
                case "sort_preset":
                case "direction":
                    break;
                default:
                    $strCond .= "{$key}='{$val}' AND \n"; // placeholders        "key" = :key
                    $params["{$key}"] = "{$val}"; // bindParam        "key"=>val
                    break;
            }
        }

        return [$strCond, $params];
    }

    /**
     * get list data
     */
    public function get_data_list() {
        $data      = $this->request->getJSON();
        $token     = $this->getAuthHeader();
        $http_code = 200;

        //Validate Data

        $limit  = intval( $data->rowsPerpage );
        $offset = ( $data->page_index - 1 ) * $limit;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }


        // ???? Condition
        list( $strCond, $params ) = $this->_getCond( $data );

        $query_str = "
        SELECT *
        FROM mst_user
        WHERE " . $strCond . " active_flag = true
        ORDER BY user_id
        LIMIT {$limit} OFFSET {$offset}
        ";
        //print_r($query_str);exit;
        $query_count = "
        SELECT count(user_id) as my_count
        FROM mst_user
        WHERE " . $strCond . " active_flag = true
        ORDER BY user_id
        ";

        $itemn_data = $this->db->query( $query_str, [$result->company_id] )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $itemn_count = $this->db->query( $query_count, [$result->company_id] )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']   = "success";
        $dataDB['message']  = "";
        $dataDB['data']     = $itemn_data;
        $dataDB['max_rows'] = $itemn_count[0]->my_count;

        return $this->respond( $dataDB, $http_code );
    }

    public function update_data() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        $http_code = 200;

        //get data from token
        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        //init data
        $user_id            = isset( $data->user_id ) ? trim( $data->user_id ) : '';
        $employee_id        = isset( $data->employee_id ) ? $data->employee_id : '';
        $title              = isset( $data->title ) ? trim( $data->title ) : -1;
        $first_name         = isset( $data->first_name ) ? trim( $data->first_name ) : '';
        $last_name          = isset( $data->last_name ) ? $data->last_name : '';
        $gender             = isset( $data->gender ) ? trim( $data->gender ) : -1;
        $join_date          = isset( $data->join_date ) ? trim( $data->join_date ) : '';
        $birthday           = isset( $data->birthday ) ? $data->birthday : '';
        $login_id           = isset( $data->login_id ) ? trim( $data->login_id ) : '';
        $user_password      = isset( $data->user_password ) ? trim( $data->user_password ) : '';
        $user_group_id      = isset( $data->user_group_id ) ? trim( $data->user_group_id ) : -1;
        $id_card            = isset( $data->id_card ) ? trim( $data->id_card ) : '';
        $tax_id             = isset( $data->tax_id ) ? trim( $data->tax_id ) : '';
        $social_id          = isset( $data->social_id ) ? trim( $data->social_id ) : '';
        $education_level    = isset( $data->education_level ) ? trim( $data->education_level ) : '';
        $field_of_study     = isset( $data->field_of_study ) ? trim( $data->field_of_study ) : '';
        $institution        = isset( $data->institution ) ? trim( $data->institution ) : '';
        $gpa                = isset( $data->gpa ) ? trim( $data->gpa ) : '';
        $address            = isset( $data->address ) ? trim( $data->address ) : '';
        $province           = isset( $data->province ) ? trim( $data->province ) : '';
        $post_code          = isset( $data->post_code ) ? trim( $data->post_code ) : '';
        $phone              = isset( $data->phone ) ? trim( $data->phone ) : '';
        $mobile             = isset( $data->mobile ) ? trim( $data->mobile ) : '';
        $e_mail             = isset( $data->e_mail ) ? trim( $data->e_mail ) : '';
        $reference_name     = isset( $data->reference_name ) ? trim( $data->reference_name ) : '';
        $reference_phone    = isset( $data->reference_phone ) ? trim( $data->reference_phone ) : '';
        $bank_name          = isset( $data->bank_name ) ? trim( $data->bank_name ) : '';
        $bank_account       = isset( $data->bank_account ) ? trim( $data->bank_account ) : '';
        $position_name      = isset( $data->position_name ) ? trim( $data->position_name ) : '';
        $salary             = isset( $data->salary ) ? trim( $data->salary ) : 0.00;
        $ot1                = isset( $data->ot1 ) ? trim( $data->ot1 ) : 0.00;
        $ot2                = isset( $data->ot2 ) ? trim( $data->ot2 ) : 0.00;
        $ot3                = isset( $data->ot3 ) ? trim( $data->ot3 ) : 0.00;
        $remark             = isset( $data->remark ) ? trim( $data->remark ) : 0.00;

        //Validation Data
        if ( $first_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        if ( $employee_id == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัสพนักงาน";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        if ( $user_id == -1 ) {
            $old_data = $this->mst_item->getWhere( ['item_code' => $item_code, 'active_flag' => false] )->getRow();
            if ( isset( $old_data ) ) {
                $old_item_code = $old_data->item_code;
            }
        } else {
            $old_data = $this->mst_item->getWhere( ['item_code' => $old_item_code] )->getRow();
            if ( $old_data->image_file != $image_file ) {
                if ( file_exists (WRITEPATH.'/uploads/item/'.$old_data->image_file) ) {
                    unlink(WRITEPATH.'/uploads/item/'.$old_data->image_file);
                }
            }
        }

        $insert_data = [];

        //$insert_data['m_company_id']    = $result->company_id;

        //set data to array for add or update
        $insert_data['item_code']            = $item_code;
        $insert_data['item_name']            = $item_name;
        $insert_data['item_type']            = $item_type;
        $insert_data['lot_flag']             = $lot_flag;
        $insert_data['unit_code']            = $unit_code;
        $insert_data['standard_location']    = $standard_location;
        $insert_data['production_lead_time'] = $production_lead_time;
        $insert_data['request_decimal']      = $request_decimal;
        $insert_data['mrp_flag']             = $mrp_flag;
        $insert_data['remark']               = $remark;
        $insert_data['image_file']           = $image_file;
        $insert_data['active_flag']          = true;

        $this->db->transStart();

        if ( $old_item_code == '-1' ) {
            $insert_data['create_date'] = date( "Y-m-d H:i:s" );
            $insert_data['create_user'] = $result->user_id;
            $this->mst_item->insert( $insert_data );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, $http_code );
            }
        } else {
            $insert_data['update_date'] = date( "Y-m-d H:i:s" );
            $insert_data['update_user'] = $result->user_id;

            $this->mst_item->update( $insert_data, ['item_code' => $old_item_code] );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, $http_code );
            }
        }
        $this->db->transComplete();

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $insert_data;

        return $this->respond( $dataDB, $http_code );
    }
}
