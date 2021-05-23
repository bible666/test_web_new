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

        //$this->prg_examiners_fra_a( $insert_data, ['id' => $id] );

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
     * update / insert data to database
     */
    public function update_data()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //get data from token
        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
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

        $my_date = explode("/",$data->exam_date);

        if ( count($my_date) == 3 ) {
            $data->exam_date = $my_date[2]."-".$my_date[1]."-".$my_date[0];
        }
        $data->question_12          = ($this->calculateBMI($data->weight,$data->height) < 18.5) ? 1 : 0;
        $data->living_status        = $this->getLivingStatus($data);
        $data->hypokinesia          = $this->getHypokinesia($data);
        $data->decreased_nutrition  = $this->getDecreasedNutrition($data);
        $data->deterioration_mouth  = $this->getDeteriorationMouth($data);
        $data->withdrawal           = $this->getWithdrawal($data);
        $data->forget               = $this->getForget($data);
        $data->depression           = $this->getDepression($data);
        $data->total_score          = $this->getTotalScore($data);
        $data->frailty_judgment     = $this->getFrailtyJudgment($data->total_score);

        $this->db->transStart();
        if ( $this->prgExaminersFraAModel->save($data) === false ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->prgExaminersFraAModel->errors();
            $dataDB['data']    = "";

            return $this->respond( $dataDB, HTML_STATUS_DB_ERROR );
        }

        $this->db->transComplete();

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );
    }

    private function getLivingStatus($data) {
        return $data->question_1 + $data->question_2 + $data->question_3 + $data->question_4 + $data->question_5;
    }
    
    private function getHypokinesia($data) {
        return $data->question_6 + $data->question_7 + $data->question_8 + $data->question_9 + $data->question_10;
    }

    private function getDecreasedNutrition($data) {
        return $data->question_11 + $data->question_12;
    }

    private function getDeteriorationMouth($data) {
        return $data->question_13 + $data->question_14 + $data->question_15;
    }

    private function getWithdrawal($data) {
        return $data->question_16 + $data->question_17;
    }

    private function getForget($data) {
        return $data->question_18 + $data->question_19 + $data->question_20;
    }

    private function getDepression($data) {
        return $data->question_21 + $data->question_22 + $data->question_23 + $data->question_24 + $data->question_25;
    }

    private function getTotalScore($data) {
        return $data->question_1 + $data->question_2 + $data->question_3 + $data->question_4 + $data->question_5
              +$data->question_6 + $data->question_7 + $data->question_8 + $data->question_9 + $data->question_10
              +$data->question_11 + $data->question_12 + $data->question_13 + $data->question_14 + $data->question_15
              +$data->question_16 + $data->question_17 + $data->question_18 + $data->question_19 + $data->question_20
              +$data->question_21 + $data->question_22 + $data->question_23 + $data->question_24 + $data->question_25;
    }

    private function calculateBMI($weight, $height) {
        $_bmi = $weight / pow(($height/100), 2);
        return round($_bmi, 1);
    }

    private function getFrailtyJudgment(int $total_score){
        $return_value = 0;
        if (($total_score >= 0) && ($total_score <= 3)) {
            $return_value = 1;
        } else if (($total_score >= 4) && ($total_score <= 7)) {
            $return_value = 2;
        } else {
            $return_value = 3;
        }
        
        return $return_value;
    }

}
