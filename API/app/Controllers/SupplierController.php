<?php
namespace App\Controllers;

use Config\App;

class SupplierController extends Origin001
{
    protected $format = 'json';

    protected $mst_supplier;

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

        $this->mst_supplier = $this->db->table( 'mst_supplier' );

    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token         = $this->getAuthHeader();
        $supplier_code = isset( $data->supplier_code ) ? $data->supplier_code : -1;

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

        $this->mst_supplier->update( $insert_data, ['supplier_code' => $supplier_code] );

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
        $supplier_code = isset( $data->supplier_code ) ? $data->supplier_code : -1;

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
			FROM mst_supplier
			WHERE supplier_code = :supplier_code:
				AND active_flag = true
			";

            $db_data = $this->db->query( $query_str, ['supplier_code' => $supplier_code] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            if ( isset( $db_data ) ) {
                $dataDB['status']  = "success";
                $dataDB['message'] = $query_str;
                $dataDB['data']    = $db_data;
            } else {
                $dataDB['status']  = "error";
                $dataDB['message'] = "data not found";
                $dataDB['data']    = "";
            }

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

                case "supplier_name":
                    $strCond .= " LOWER(supplier_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "supplier_code":
                    $strCond .= " LOWER(supplier_code) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
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
			FROM mst_supplier
			WHERE " . $strCond . " active_flag = true
			ORDER BY supplier_code
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(supplier_code) as my_count
			FROM mst_supplier
			WHERE " . $strCond . " active_flag = true
			ORDER BY supplier_code
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
        $old_supplier_code = isset( $data->old_supplier_code ) ? $data->old_supplier_code : -1;

        $supplier_code = isset( $data->supplier_code ) ? trim( $data->supplier_code ) : '';
        $supplier_name = isset( $data->supplier_name ) ? trim( $data->supplier_name ) : '';
        $address       = isset( $data->address ) ? trim( $data->address ) : '';
        $post_code     = isset( $data->post_code ) ? trim( $data->post_code ) : '';
        $tel_no        = isset( $data->tel_no ) ? trim( $data->tel_no ) : '';
        $fax_no        = isset( $data->fax_no ) ? trim( $data->fax_no ) : '';
        $e_mail        = isset( $data->e_mail ) ? trim( $data->e_mail ) : '';
        $contact       = isset( $data->contact ) ? trim( $data->contact ) : '';
        $delivery_time = isset( $data->delivery_time ) ? $data->delivery_time : 0;
        $tax_id        = isset( $data->tax_id ) ? trim( $data->tax_id ) : '';
        $payment_tearm = isset( $data->payment_tearm ) ? trim( $data->payment_tearm ) : '';

        $remark = isset( $data->remark ) ? trim( $data->remark ) : '';

        //Validation Data
        if ( $supplier_code == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัส";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $supplier_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อ";
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

            if ( $this->is_dupplicate_data( $old_supplier_code, $supplier_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสนี้มีการใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            if ( $old_supplier_code == -1 ) {
                $old_data = $this->mst_supplier->getWhere( ['supplier_code' => $supplier_code, 'active_flag' => false] )->getRow();
                if ( isset( $old_data ) ) {
                    $old_supplier_code = $old_data->supplier_code;
                }
            }

            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['supplier_code'] = $supplier_code;
            $insert_data['supplier_name'] = $supplier_name;
            $insert_data['address']       = $address;
            $insert_data['post_code']     = $post_code;
            $insert_data['tel_no']        = $tel_no;
            $insert_data['fax_no']        = $fax_no;
            $insert_data['e_mail']        = $e_mail;
            $insert_data['contact']       = $contact;
            $insert_data['delivery_time'] = $delivery_time;
            $insert_data['tax_id']        = $tax_id;
            $insert_data['payment_tearm'] = $payment_tearm;

            $insert_data['remark']      = $remark;
            $insert_data['active_flag'] = true;

            $this->db->transStart();

            if ( $old_supplier_code == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_supplier->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_supplier->update( $insert_data, ['supplier_code' => $old_supplier_code] );
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
    private function is_dupplicate_data( $old_supplier_code, $supplier_code )
    {
        $is_check = true;

        if ( $old_supplier_code == $supplier_code ) {
            return false; // OK data
        }

        $data = $this->mst_supplier->getWhere( [
            'supplier_code'    => $supplier_code,
            'supplier_code !=' => $old_supplier_code,
            'active_flag'      => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }

}
