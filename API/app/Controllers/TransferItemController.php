<?php
namespace App\Controllers;

use Config\App;
use App\Controllers\stock_transaction_type;

class TransferItemController extends Origin001
{
    protected $format = 'json';

    protected $prg_transfer_h;
    protected $prg_transfer_d;
    protected $prg_stock_transaction;
    protected $prg_stock;

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

        $this->prg_transfer_h        = $this->db->table( 'prg_transfer_h' );
        $this->prg_transfer_d        = $this->db->table( 'prg_transfer_d' );
        $this->prg_stock_transaction = $this->db->table( 'prg_stock_transaction' );
        $this->prg_stock             = $this->db->table( 'prg_stock' );

    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        //print_r(stock_transaction_type::TRANSFER);exit;

        //test transfer data
        $this->transaction_save(stock_transaction_type::TRANSFER,"test","T0001_F1","IT","IT0001","","2020-01-01",-2,200);
        $this->transaction_save(stock_transaction_type::TRANSFER,"test","T0001_F1","QA","IT0001","","2020-01-01",2,200);
        // $data = $this->request->getJSON();

        // //init data
        // $token         = $this->getAuthHeader();
        // $customer_code = isset( $data->customer_code ) ? $data->customer_code : -1;

        // $result = $this->_checkToken( $token );
        // //print_r($result);
        // if ( $result->user_id > 0 ) {
        //     $insert_data['active_flag'] = false;
        //     $insert_data['update_date'] = date( "Y-m-d H:i:s" );
        //     $insert_data['update_user'] = $result->user_id;

        //     $this->mst_customer->update( $insert_data, ['customer_code' => $customer_code] );

        //     if ( $this->db->error()['message'] !== '' ) {
        //         $dataDB['status']  = "error";
        //         $dataDB['message'] = $this->db->error()['message'];
        //         $dataDB['data']    = "";

        //         return $this->respond( $dataDB, 200 );
        //     }

        //     $dataDB['status']  = "success";
        //     $dataDB['message'] = "";
        //     $dataDB['data']    = $data;

        // } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        // }

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
        $customer_code = isset( $data->customer_code ) ? $data->customer_code : -1;

        $result = $this->_checkToken( $token );
        if ( $result->user_id > 0 ) {
            $query_str = "
			SELECT *
			FROM mst_customer
			WHERE customer_code = :customer_code:
				AND active_flag = true
			";

            $db_data = $this->db->query( $query_str, ['customer_code' => $customer_code] )->getRow();

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

                case "customer_name":
                    $strCond .= " LOWER(customer_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "customer_code":
                    $strCond .= " LOWER(customer_code) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
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
        if ( $result->user_id >= 0 ) {

            // ???? Condition
            list( $strCond, $params ) = $this->_getCond( $data );

            $query_str = "
			SELECT *
			FROM mst_customer
			WHERE " . $strCond . " active_flag = true
			ORDER BY customer_code
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(customer_code) as my_count
			FROM mst_customer
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
        $old_customer_code = isset( $data->old_customer_code ) ? $data->old_customer_code : -1;

        $customer_code = isset( $data->customer_code ) ? trim( $data->customer_code ) : '';
        $customer_name = isset( $data->customer_name ) ? trim( $data->customer_name ) : '';
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
        if ( $token == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token is empty";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $customer_code == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัส";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $customer_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อ";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        //get data from token
        $result = $this->_checkToken( $token );

        if ( $result->user_id > 0 ) {

            if ( $this->is_dupplicate_data( $old_customer_code, $customer_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสนี้มีการใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            if ( $old_customer_code == -1 ) {
                $old_data = $this->mst_customer->getWhere( ['customer_code' => $customer_code, 'active_flag' => false] )->getRow();
                if ( isset( $old_data ) ) {
                    $old_customer_code = $old_data->customer_code;
                }
            }

            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['customer_code'] = $customer_code;
            $insert_data['customer_name'] = $customer_name;
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

            if ( $old_customer_code == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_customer->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_customer->update( $insert_data, ['customer_code' => $old_customer_code] );
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
    private function is_dupplicate_data( $old_customer_code, $customer_code )
    {
        $is_check = true;

        if ( $old_customer_code == $customer_code ) {
            return false; // OK data
        }

        $data = $this->mst_customer->getWhere( [
            'customer_code'    => $customer_code,
            'customer_code !=' => $old_customer_code,
            'active_flag'      => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }

}
