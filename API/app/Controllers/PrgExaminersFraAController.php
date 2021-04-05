<?php
namespace App\Controllers;

use Config\App;
use App\Models\PrgExaminersFraAModel;

class PrgExaminersFraAController extends Origin001
{
    protected $format = 'json';

    protected $prg_examiners_fra_a;
    protected $prgExaminersFraAModel;

    /**
     * Constructure class
     */
    public function initController( \CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger )
    {

        // Do Not Edit This Line
        parent::initController( $request, $response, $logger );

        //--------------------------------------------------------------------
        // Preload any models, libraries, etc, here.
        //--------------------------------------------------------------------
        // E.g.:
        // $this->session = \Config\Services::session();

        $this->prg_examiners_fra_a = $this->db->table( 'prg_examiners_fra_a' );
        $this->prgExaminersFraAModel = new PrgExaminersFraAModel();
    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token         = $this->getAuthHeader();
        $id = isset( $data->id ) ? $data->id : -1;

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

        $this->prg_examiners_fra_a( $insert_data, ['id' => $id] );

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        return $this->respond( $dataDB, 200 );
    }

    /**
     * get data by id
     */
    public function get_data_by_id()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $id = isset( $data->id ) ? $data->id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }


        $query_str = "
        SELECT *
        FROM prg_examiners_fra_a
        WHERE id = :id:
            AND active_flag = true
        ";

        $db_data = $this->db->query( $query_str, ['id' => $id] )->getRow();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = $query_str;
        $dataDB['data']    = $db_data;

        return $this->respond( $dataDB, 200 );
    }

    private function _getCond( $s )
    {
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
    public function get_data_list()
    {
        $data  = $this->request->getJSON();
        $token = $this->getAuthHeader();

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

        if ( $result->user_id >= 0 ) {

            // ???? Condition
            list( $strCond, $params ) = $this->_getCond( $data );

            $query_str = "
			SELECT *
			FROM prg_examiners_fra_a
			WHERE " . $strCond . " active_flag = true
			ORDER BY exam_date DESC
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(id) as my_count
			FROM prg_examiners_fra_a
			WHERE " . $strCond . " active_flag = true
			";

            $itemn_data = $this->db->query( $query_str, [$result->company_id] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $itemn_count = $this->db->query( $query_count, [$result->company_id] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']   = "success";
            $dataDB['message']  = "";
            $dataDB['data']     = $itemn_data;
            $dataDB['max_rows'] = $itemn_count[0]->my_count;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

    /**
     * ีupdate / insert data to database
     */
    public function update_data()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $id             = isset( $data->id ) ? trim( $data->id ) : '';
        $examiner_id    = isset( $data->examiner_id ) ? trim( $data->examiner_id ) : '';
        $exam_date      = isset( $data->exam_date ) ? trim( $data->exam_date ) : '';
        $question_1     = isset( $data->question_1 ) ? trim( $data->question_1 ) : 0;
        $question_2     = isset( $data->question_2 ) ? trim( $data->question_2 ) : 0;
        $question_3     = isset( $data->question_3 ) ? trim( $data->question_3 ) : 0;
        $question_4     = isset( $data->question_4 ) ? trim( $data->question_4 ) : 0;
        $question_5     = isset( $data->question_5 ) ? trim( $data->question_5 ) : 0;
        $question_6     = isset( $data->question_6 ) ? trim( $data->question_6 ) : 0;
        $question_7     = isset( $data->question_7 ) ? trim( $data->question_7 ) : 0;
        $question_8     = isset( $data->question_8 ) ? trim( $data->question_8 ) : 0;
        $question_9     = isset( $data->question_9 ) ? trim( $data->question_9 ) : 0;
        $question_10    = isset( $data->question_10 ) ? trim( $data->question_10 ) : 0;
        $question_11    = isset( $data->question_11 ) ? trim( $data->question_11 ) : 0;
        $question_12    = isset( $data->question_12 ) ? trim( $data->question_12 ) : 0;
        $question_13    = isset( $data->question_13 ) ? trim( $data->question_13 ) : 0;
        $question_14    = isset( $data->question_14 ) ? trim( $data->question_14 ) : 0;
        $question_15    = isset( $data->question_15 ) ? trim( $data->question_15 ) : 0;
        $question_16    = isset( $data->question_16 ) ? trim( $data->question_16 ) : 0;
        $question_17    = isset( $data->question_17 ) ? trim( $data->question_17 ) : 0;
        $question_18    = isset( $data->question_18 ) ? trim( $data->question_18 ) : 0;
        $question_19    = isset( $data->question_19 ) ? trim( $data->question_19 ) : 0;
        $question_20    = isset( $data->question_20 ) ? trim( $data->question_20 ) : 0;
        $question_21    = isset( $data->question_21 ) ? trim( $data->question_21 ) : 0;
        $question_22    = isset( $data->question_22 ) ? trim( $data->question_22 ) : 0;
        $question_23    = isset( $data->question_23 ) ? trim( $data->question_23 ) : 0;
        $question_24    = isset( $data->question_24 ) ? trim( $data->question_24 ) : 0;
        $question_25    = isset( $data->question_25 ) ? trim( $data->question_25 ) : 0;
        $remark         = isset( $data->remark ) ? trim( $data->remark ) : '';

        //Validation Data
        if ( $id == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัส";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $examiner_id == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุคนทดสอบ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $exam_date == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุวันที่ทดสอบ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        //get data from token
        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        if ( $result->user_id > 0 ) {
            $insert_data = [];

            //set data to array for add or update
            $insert_data['id']          = $id;
            $insert_data['examiner_id'] = $examiner_id;
            $insert_data['exam_date']   = $exam_date;
            $insert_data['question_1']  = $question_1;
            $insert_data['question_2']  = $question_2;
            $insert_data['question_3']  = $question_3;
            $insert_data['question_4']  = $question_4;
            $insert_data['question_5']  = $question_5;
            $insert_data['question_6']  = $question_6;
            $insert_data['question_7']  = $question_7;
            $insert_data['question_8']  = $question_8;
            $insert_data['question_9']  = $question_9;
            $insert_data['question_10'] = $question_10;
            $insert_data['question_11'] = $question_11;
            $insert_data['question_12'] = $question_12;
            $insert_data['question_13'] = $question_13;
            $insert_data['question_14'] = $question_14;
            $insert_data['question_15'] = $question_15;
            $insert_data['question_16'] = $question_16;
            $insert_data['question_17'] = $question_17;
            $insert_data['question_18'] = $question_18;
            $insert_data['question_19'] = $question_19;
            $insert_data['question_20'] = $question_20;
            $insert_data['question_21'] = $question_21;
            $insert_data['question_22'] = $question_22;
            $insert_data['question_23'] = $question_23;
            $insert_data['question_24'] = $question_24;
            $insert_data['question_25'] = $question_25;
            $insert_data['remark']      = $remark;
            $insert_data['active_flag'] = true;

            $this->db->transStart();

            if ( $id == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->prg_examiners_fra_a->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->prg_examiners_fra_a->update( $insert_data, ['id' => $id] );
            }

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $this->db->transComplete();

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $insert_data;
        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );
    }

}
