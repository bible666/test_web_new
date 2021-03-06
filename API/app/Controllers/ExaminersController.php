<?php
namespace App\Controllers;

use Config\App;

use App\Models\PrgExaminersModel;

class ExaminersController extends Origin001
{
    protected $format = 'json';

    protected $prgExaminersModel;
    protected $mstGenderModel;

    public function initController( \CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger )
    {

        // Do Not Edit This Line
        parent::initController( $request, $response, $logger );

        //--------------------------------------------------------------------
        // Preload any models, libraries, etc, here.
        //--------------------------------------------------------------------
        // E.g.:
        // $this->session = \Config\Services::session();
        $this->prgExaminersModel = model('App\Models\PrgExaminersModel',false,$this->db);
        $this->mstGenderModel    = model('App\Models\MstGenderModel',false,$this->db);
    }

    /**
     * delete data by id
     */
    public function delete_data_by_id() {
        $data      = $this->request->getJSON();

        //init data
        $token     = $this->getAuthHeader();
        $id        = isset( $data->id ) ? $data->id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $dbData = $this->prgExaminersModel->find($id);

        $dbData->active_flag = false;
        $dbData->update_date = date( DATE_FORMAT_YMDHMS );
        $dbData->update_user = $result->user_id;


        if ( $this->prgExaminersModel->update($id, $dbData) === false ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->prgExaminersModel->errors();
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
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

        $item_data = $this->db->query( $query_str, ['examiner_id' => $examiner_id] )->getRow();

        if ( $item_data ) {
            $gender_data   = $this->mstGenderModel->where(['gender_code' => $item_data->gender])->first();

            $gender_select['value_code']   = $gender_data->gender_code;
            $gender_select['display_code'] = $gender_data->gender_name_th;

            $item_data->gender = $gender_select;
        }

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = $query_str;
        $dataDB['data']    = $item_data;

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
                    $strCond .= " CONCAT(LOWER(first_name),LOWER(last_name)) like :{$key}: AND \n"; // placeholders
                    $params["{$key}"] = "%".strtolower($val)."%";
                    break;
                case "code":
                    $strCond .= " LOWER(examiner_code) like :{$key}: AND \n"; // placeholders
                    $params["{$key}"] = "%".strtolower($val)."%";
                    break;
                case "rowsPerpage":
                case "page_index":
                case "sort":
                case "sort_preset":
                case "direction":
                    break;
                default:
                    $strCond .= "{$key}=':{$val}:' AND \n"; // placeholders        "key" = :key
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

        $limit  = intval( $data->rowsPerpage );
        $offset = $data->page_index;

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

        $itemn_data = $this->db->query( $query_str, $params )->getResult();

        $isDbError = false;
        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            $isDbError = true;
        }

        $itemn_count = $this->db->query( $query_count, $params )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            $isDbError = true;
            
        }

        if ( $isDbError ) {
            return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
        }

        $dataDB['status']   = "success";
        $dataDB['message']  = "";
        $dataDB['data']     = $itemn_data;
        $dataDB['max_rows'] = $itemn_count[0]->my_count;

        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
    }

    public function update_data() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        //get data from token
        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $my_date = explode("/",$data->birthdate);

        if ( count($my_date) == 3 ) {
            $data->birthdate = $my_date[2]."-".$my_date[1]."-".$my_date[0];
        }

        if ( $data->id == '-1' ) {
            unset($data->id);
            $data->active_flag  = true;
            $data->create_date  = date( DATE_FORMAT_YMDHMS );
            $data->create_user  = $result->user_id;
        } else {
            $data->active_flag  = true;
            $data->update_date  = date( DATE_FORMAT_YMDHMS );
            $data->update_user  = $result->user_id;
        }

        $data->gender = $data->gender->value_code;

        $this->db->transStart();
        if ( $this->prgExaminersModel->save($data) === false ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->prgExaminersModel->errors();
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_DB_ERROR );
        }

        $this->db->transComplete();

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
    }
}
