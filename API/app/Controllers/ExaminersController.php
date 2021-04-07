<?php
namespace App\Controllers;

use Config\App;

use App\Models\PrgExaminersModel;

class ExaminersController extends Origin001
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

        $this->prg_examiners_table = $this->db->table( 'prg_examiners' );
        $this->prg_token           = $this->db->table( 'prg_token' );
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
        $examiner_id = isset( $data->id ) ? $data->id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT *
        FROM prg_examiners
        WHERE id = :examiner_id:
            AND active_flag = true
        ";

        $itemn_data = $this->db->query( $query_str, ['examiner_id' => $examiner_id] )->getRow();

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
        FROM prg_examiners
        WHERE " . $strCond . " active_flag = true
        ORDER BY first_name
        LIMIT {$limit} OFFSET {$offset}
        ";

        $query_count = "
        SELECT count(id) as my_count
        FROM prg_examiners
        WHERE " . $strCond . " active_flag = true
        ORDER BY first_name
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
        $id             = isset( $data->id )            ? $data->id                  : -1;
        $area_id        = isset( $data->area_id )       ? $data->area_id             : 0;
        $examiner_code  = isset( $data->examiner_code ) ? trim($data->examiner_code) : '';
        $first_name     = isset( $data->first_name )    ? trim($data->first_name)    : '';
        $last_name      = isset( $data->last_name )     ? trim($data->last_name)     : '';
        $birthdate      = isset( $data->birthdate )     ? $data->birthdate           : '';
        $gender         = isset( $data->gender )        ? trim($data->gender)        : '';
        $prefectures    = isset( $data->prefectures )   ? $data->prefectures         : 0;
        $address        = isset( $data->address )       ? trim($data->address)       : '';
        $remarks        = isset( $data->remarks )       ? trim($data->remarks)       : '';

        //Validation Data
        if ( $first_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        if ( $id == -1 ) {
            $old_data = $this->prg_examiners_table->getWhere( ['examiner_code' => $examiner_code, 'active_flag' => false] )->getRow();
            if ( isset( $old_data ) ) {
                $old_examiner_code = $old_data->examiner_code;
            }
        } else {
            $old_data = $this->prg_examiners_table->getWhere( ['examiner_code' => $examiner_code] )->getRow();
        }

        $insert_data = [];

        //set data to array for add or update
        if ( $area_id != 0) {
            $insert_data['area_id']         = $area_id;
        }
        
        $insert_data['examiner_code']   = $examiner_code;
        $insert_data['first_name']      = $first_name;
        $insert_data['last_name']       = $last_name;
        $insert_data['birthdate']       = $birthdate;
        $insert_data['gender']          = $gender;
        $insert_data['prefectures']     = $prefectures;
        $insert_data['address']         = $address;
        $insert_data['remarks']         = $remarks;
        $insert_data['active_flag']     = true;

        $this->db->transStart();

        if ( $id == '-1' ) {
            $insert_data['create_date'] = date( DATE_FORMAT_YMDHMS );
            $insert_data['create_user'] = $result->user_id;
            $this->prg_examiners_table->insert( $insert_data );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, $http_code );
            }
        } else {
            $insert_data['update_date'] = date( DATE_FORMAT_YMDHMS );
            $insert_data['update_user'] = $result->user_id;

            $this->prg_examiners_table->update( $insert_data, ['id' => $id] );

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
