<?php
namespace App\Controllers;

use Config\App;

class CompanyController extends Origin001
{
    protected $format = 'json';

    protected $mst_company;

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

        $this->mst_company = $this->db->table( 'mst_company' );
    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token = $this->getAuthHeader();
        $id    = isset( $data->company_code ) ? $data->company_code : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        if ( $result->user_id > 0 ) {
            $insert_data['active_flag'] = false;
            $insert_data['update_date'] = date( "Y-m-d H:i:s" );
            $insert_data['update_user'] = $result->user_id;

            $this->mst_company->where( [
                'company_code' => $id,
            ] );
            $this->mst_company->update( $insert_data );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

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

        if ( $result->user_id > 0 ) {
            $itemn_data = $this->mst_company->getWhere( [
                'company_code' => $id,
                'active_flag'  => true,
            ] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $itemn_data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

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

                case "company_name":
                    $strCond .= " LOWER(company_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
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

    public function get_calendar()
    {
        $token = $this->getAuthHeader();

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = " SELECT * FROM mst_calendar where active_flag = true";

        $itemn_data = $this->db->query( $query_str )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $itemn_data;

        return $this->respond( $dataDB, 200 );
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
			FROM mst_company
			WHERE " . $strCond . " active_flag = true
			ORDER BY company_code
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(company_code) as my_count
			FROM mst_company
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
     * à¸µupdate / insert data to database
     */
    public function update_data()
    {
        $token = $this->getAuthHeader();
        $data  = $this->request->getJSON();

        //init data
        $id           = isset( $data->id ) ? $data->id : -1;
        $company_code = isset( $data->company_code ) ? $data->company_code : '';
        $company_name = isset( $data->company_name ) ? $data->company_name : '';
        $address      = isset( $data->address ) ? $data->address : '';
        $zip          = isset( $data->zip ) ? $data->zip : '';
        $telno        = isset( $data->telno ) ? $data->telno : '';
        $faxno        = isset( $data->faxno ) ? $data->faxno : '';
        $email        = isset( $data->email ) ? $data->email : '';
        $cal_no       = isset( $data->cal_no ) ? $data->cal_no : null;
        $remark       = isset( $data->remark ) ? $data->remark : '';

        //Validation Data

        if ( $company_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "ชื่อต้องไม่เป็นค่าว่าง";
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

            if ( $this->is_dupplicate_data( $id, $company_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสบริษัทนี้ใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );

            }

            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['company_code'] = trim( $company_code );
            $insert_data['company_name'] = trim( $company_name );
            $insert_data['address']      = trim( $address );
            $insert_data['zip']          = trim( $zip );
            $insert_data['telno']        = trim( $telno );
            $insert_data['faxno']        = trim( $faxno );
            $insert_data['email']        = trim( $email );
            $insert_data['cal_no']       = $cal_no;
            $insert_data['active_flag']  = true;
            $insert_data['remark']       = trim( $remark );

            $this->db->transStart();

            if ( $id == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_company->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_company->where( 'company_code', $id );
                $this->mst_company->update( $insert_data );
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

    /**
     * check suppliser code dupplicate
     *
     * @param $m_company_id company id
     * @param $currency_code currency code
     *
     * @return boolean true= dupplicate, false not dupplicate
     */
    private function is_dupplicate_data( $old, $new )
    {
        $is_check = true;

        if ( $old == $new ) {
            return false; // OK data
        }

        $data = $this->mst_company->getWhere( [
            'company_code'    => $new,
            'company_code !=' => $old,
            'active_flag'     => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }
}
