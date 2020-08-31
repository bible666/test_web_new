<?php
namespace App\Controllers;

use Config\App;

class FactoryController extends Origin001
{
    protected $format = 'json';

    protected $mst_company;
    protected $mst_factory;

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
        $this->mst_factory = $this->db->table( 'mst_factory' );

    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token      = $this->getAuthHeader();
        $factory_cd = isset( $data->factory_code ) ? $data->factory_code : -1;
        $company_cd = isset( $data->company_code ) ? $data->company_code : -1;

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

            $where = [
                'company_code' => $company_cd,
                'factory_code' => $factory_cd,
            ];
            $this->mst_factory->update( $insert_data, $where );

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
        $factory_cd = isset( $data->factory_code ) ? $data->factory_code : -1;
        $company_cd = isset( $data->company_code ) ? $data->company_code : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        if ( $result->user_id > 0 ) {
            $query_str = "
            SELECT *
            FROM mst_factory
            WHERE company_code = :company_cd:
                AND factory_code = :factory_cd:
                AND active_flag = true
            ";

            $itemn_data = $this->db->query( $query_str, ['company_cd' => $company_cd, 'factory_cd' => $factory_cd] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $dataDB['status']  = "success";
            $dataDB['message'] = $query_str;
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

    public function get_company()
    {
        $token = $this->getAuthHeader();

        $query_str = " SELECT * FROM mst_company where active_flag = true";

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

        // ???? Condition
        list( $strCond, $params ) = $this->_getCond( $data );

        $query_str = "
        SELECT *
        FROM mst_factory
        WHERE " . $strCond . " active_flag = true
        ORDER BY company_code
        LIMIT {$limit} OFFSET {$offset}
        ";
        //print_r($query_str);exit;
        $query_count = "
        SELECT count(company_code) as my_count
        FROM mst_factory
        WHERE " . $strCond . " active_flag = true
        ORDER BY company_code,factory_code
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
        $old_company = isset( $data->old_company ) ? trim( $data->old_company ) : '';
        $old_factory = isset( $data->old_factory ) ? trim( $data->old_factory ) : '';

        $factory_code = isset( $data->factory_code ) ? trim( $data->factory_code ) : '';
        $company_code = isset( $data->company_code ) ? trim( $data->company_code ) : '';
        $factory_name = isset( $data->factory_name ) ? trim( $data->factory_name ) : '';
        $address      = isset( $data->address ) ? trim( $data->address ) : '';
        $telno        = isset( $data->telno ) ? trim( $data->telno ) : '';
        $faxno        = isset( $data->faxno ) ? trim( $data->faxno ) : '';
        $email        = isset( $data->email ) ? trim( $data->email ) : '';
        $cal_no       = isset( $data->cal_no ) ? $data->cal_no : null;
        $remark       = isset( $data->remark ) ? trim( $data->remark ) : '';

        //Validation Data
        if ( $factory_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อโรงงาน";
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

            if ( $this->is_dupplicate_data( $old_company, $old_factory, $company_code, $factory_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสนี้ใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );

            }

            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['company_code'] = $company_code;
            $insert_data['factory_code'] = $factory_code;
            $insert_data['factory_name'] = $factory_name;
            $insert_data['address']      = $address;

            $insert_data['telno']       = $telno;
            $insert_data['faxno']       = $faxno;
            $insert_data['email']       = $email;
            $insert_data['cal_no']      = $cal_no;
            $insert_data['active_flag'] = true;
            $insert_data['remark']      = $remark;

            $this->db->transStart();

            if ( $old_company == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_factory->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_factory->update( $insert_data, ['company_code' => $old_company, 'factory_code' => $old_factory] );
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
    private function is_dupplicate_data( $old_company, $old_factory, $company, $factory )
    {
        $is_check = true;

        if (  ( $old_company == $company ) && ( $old_factory == $factory ) ) {
            return false; // OK data
        }

        $data = $this->mst_factory->getWhere( [
            'company_code'     => $company,
            'company_code !='  => $old_company,
            'factory_code'     => $factory,
            'factory_code != ' => $old_factory,
            'active_flag'      => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }
}
