<?php
namespace App\Controllers;

use Config\App;

use App\Models\MstUserModel;

class UserController extends Origin001
{
    protected $format = 'json';

    protected $mst_user_table;
    protected $prg_token;

    protected $mstUserModel;

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

        $this->mstUserModel = model('App\Models\MstUserModel',false,$this->db);
    }

    public function login() {
        $data = $this->request->getJSON();

        //Get Data From Post
        $user_login    = isset( $data->user_login ) ? $data->user_login : '';
        $user_password = isset( $data->user_password ) ? $data->user_password : '';

        //init data

        $dataDB['status']  = "error";
        $dataDB['message'] = "";
        $dataDB['data']    = "";

        $row = $this->mstUserModel->where(['login_id' => $user_login, 'active_flag' => true])->first();

        if ( !isset( $row ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "ไม่สามารถเข้าใช้งานระบบได้ login หรือ password ผิดพลาด";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        $nowData   = strtotime( date( DATE_FORMAT_YMDHMS ) );
        $diff_time = round( abs( $nowData - strtotime( $row->last_ng_time ) ) / 60, 2 );

        if ( $row->ng_count >= MAX_LOGIN_COUNT && $diff_time <= MAX_LOCK_LOGIN_TIME_MINIUS ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = 'คุณ login เกินจำนวนครั้งที่กำหนด กรุณาลองใหม่อีกครั้งหลังผ่าน ' . MAX_LOCK_LOGIN_TIME_MINIUS . ' นาที';
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        if ( $user_password != $row->user_password ) {
            $user_update = [
                'last_ng_time' => date( DATE_FORMAT_YMDHMS ),
                'update_date'  => date( DATE_FORMAT_YMDHMS ),
                'ng_count'     => $row->ng_count + 1,
            ];
            $this->mstUserModel->update( $row->user_id,$user_update );

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
        $TokenData['create_date'] = date( DATE_FORMAT_YMDHMS );
        $this->prg_token->insert( $TokenData );

        //update user table
        $data = [
            'update_date'     => date( DATE_FORMAT_YMDHMS ),
            'last_login_time' => date( DATE_FORMAT_YMDHMS ),
            'last_ng_time'    => null,
            'ng_count'        => 0,
        ];
        $this->mstUserModel->update( $row->user_id,$data );

        //Get Menu Data
        $sql = "
        SELECT sm.*,mmp.permission_flag
        FROM mst_menu_permission mmp inner join sys_menu sm on mmp.menu_id  =  sm.menu_id
            INNER JOIN mst_user_group mug on mmp.user_group_id = mug.user_group_id
        WHERE mug.department_code = :department_code: and mug.position_code = :position_code:";

        $menu_data = $this->db->query( $sql, ['department_code' => $row->department_code, 'position_code' => $row->position_code] )->getResult();

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

        return substr( $charid, 0, 8 )
        . substr( $charid, 8, 4 )
        . substr( $charid, 12, 4 )
        . substr( $charid, 16, 4 )
        . substr( $charid, 20, 12 );
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
        $insert_data['update_date'] = date( DATE_FORMAT_YMDHMS );
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
        $address            = isset( $data->address ) ? trim( $data->address ) : '';
        $bank_account       = isset( $data->bankAccount ) ? trim( $data->bankAccount ) : '';
        $bank_name          = isset( $data->bankName ) ? trim( $data->bankName ) : '';
        $birthday           = isset( $data->birthday ) ? $data->birthday : '';
        $department_code    = isset( $data->department_code ) ? trim( $data->department_code ) : '';
        $e_mail             = isset( $data->eMail ) ? trim( $data->eMail ) : '';
        $education_level    = isset( $data->educationLevel ) ? trim( $data->educationLevel ) : '';
        $employee_id        = isset( $data->employeeId ) ? trim( $data->employeeId ) : '';
        $field_of_study     = isset( $data->fieldOfStudy ) ? trim( $data->fieldOfStudy ) : '';
        $first_name         = isset( $data->firstName ) ? trim( $data->firstName ) : '';
        $gpa                = isset( $data->gpa ) ? trim( $data->gpa ) : '';
        $id_card            = isset( $data->idCard ) ? trim( $data->idCard ) : '';
        $institution        = isset( $data->institution ) ? trim( $data->institution ) : '';
        $join_date          = isset( $data->joinDate ) ? trim( $data->joinDate ) : '';
        $last_name          = isset( $data->lastName ) ? $data->lastName : '';
        $login_id           = isset( $data->loginId ) ? trim( $data->loginId ) : '';
        $mobile             = isset( $data->mobile ) ? trim( $data->mobile ) : '';
        $old_user_id         = isset ( $data->oldUserId ) ? trim( $data->oldUserId ) : 0;
        $ot1                = isset( $data->ot1 ) ? trim( $data->ot1 ) : 0.00;
        $ot2                = isset( $data->ot2 ) ? trim( $data->ot2 ) : 0.00;
        $ot3                = isset( $data->ot3 ) ? trim( $data->ot3 ) : 0.00;
        $phone              = isset( $data->phone ) ? trim( $data->phone ) : '';
        $position_code      = isset( $data->position_code ) ? trim( $data->position_code ) : '';
        $reference_name     = isset( $data->referenceName ) ? trim( $data->referenceName ) : '';
        $reference_phone    = isset( $data->referencePhone ) ? trim( $data->referencePhone ) : '';
        $remark             = isset( $data->remark ) ? trim( $data->remark ) : '';
        $retry_Password     = isset( $data->retryPassword ) ? trim( $data->retryPassword ) : '';
        $salary             = isset( $data->salary ) ? trim( $data->salary ) : 0.00;
        $social_id          = isset( $data->socialId ) ? trim( $data->socialId ) : '';
        $tax_id             = isset( $data->taxId ) ? trim( $data->taxId ) : '';
        $title_code         = isset( $data->titleCode ) ? trim( $data->titleCode ) : -1;
        $user_id            = isset( $data->userId ) ? trim( $data->userId ) : '';
        $user_password      = isset( $data->userPassword ) ? trim( $data->userPassword ) : '';
        
        


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
            $insert_data['create_date'] = date( DATE_FORMAT_YMDHMS );
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
