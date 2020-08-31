<?php
namespace App\Controllers;

//defined('BASEPATH') OR exit('No direct script access allowed');
//require('Origin001.php');

class StaffController extends Origin001
{

    /**
     * delete data by id
     */
    public function delete_data_by_id_post()
    {
        $data = $this->post();
        $data = json_decode( $data[0] );

        //init data
        $token = isset( $data->token ) ? $data->token : '';
        $id    = isset( $data->id ) ? $data->id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $insert_data['del_flag']     = 1;
        $insert_data['updated_date'] = date( "Y-m-d H:i:s" );
        $insert_data['updated']      = $result->user_id;

        $this->db->where( [
            'id'           => $id,
            'm_company_id' => $result->company_id,
        ] );
        $this->db->update( 'm_staffs', $insert_data );

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $data;

        $this->response( $dataDB, 200 );
    }

    /**
     * get data by id
     */
    public function get_data_by_id_post()
    {
        $data = $this->post();
        $data = json_decode( $data[0] );

        //init data
        $token = isset( $data->token ) ? $data->token : '';
        $id    = isset( $data->id ) ? $data->id : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT s.*
        FROM m_staffs s
        WHERE s.m_company_id = ? AND s.id = ?
            AND s.del_flag = 0
        ";

        $itemn_data = $this->db->query( $query_str, [$result->company_id, $id] )->row();

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $itemn_data;

        $this->response( $dataDB, 200 );
    }

    public function data_count_get()
    {
        $headers = [];
        foreach ( getallheaders() as $name => $value ) {
            $headers[$name] = $value;
        }
        $data = $this->get();

        $dataDB['status']  = "error";
        $dataDB['message'] = $headers['Authorization'];
        $dataDB['data']    = $data;
        $this->response( $dataDB, 200 );
    }

    /**
     * get list data
     */
    public function get_data_list_post()
    {
        $data = $this->post();
        $data = json_decode( $data[0] );

        //init data
        $token = isset( $data->token ) ? $data->token : '';

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
            FROM m_staffs
            WHERE m_company_id = ? AND del_flag = 0
            ";

            $itemn_data = $this->db->query( $query_str, [$result->company_id] )->result();

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $itemn_data;

        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }
        $this->response( $dataDB, 200 );
    }

    /**
     * ีupdate / insert data to database
     */
    public function update_data_post()
    {
        $data = $this->post();
        $data = json_decode( $data[0] );

        //init data
        $token        = isset( $data->token ) ? $data->token : '';
        $id           = isset( $data->id ) ? $data->id : -1;
        $item_code    = isset( $data->item_code ) ? $data->item_code : '';
        $item_name    = isset( $data->item_name ) ? $data->item_name : '';
        $unit_id      = isset( $data->unit_id ) ? $data->unit_id : null;
        $item_type_id = isset( $data->item_type_id ) ? $data->item_type_id : null;
        $lot_flag     = isset( $data->lot_flag ) ? $data->lot_flag : 1;
        $mrp_flag     = isset( $data->lot_flag ) ? $data->mrp_flag : 1;
        $remark       = isset( $data->remark ) ? $data->remark : '';

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

            $insert_data['m_company_id'] = $result->company_id;
            $insert_data['item_code']    = $item_code;
            $insert_data['item_name']    = $item_name;
            $insert_data['unit_id']      = $unit_id;
            $insert_data['item_type_id'] = $item_type_id;
            $insert_data['lot_flag']     = $lot_flag;
            $insert_data['mrp_flag']     = $mrp_flag;
            $insert_data['remark']       = $remark;

            $this->db->trans_start();
            if ( $id < 0 ) {
                $insert_data['created_date'] = date( "Y-m-d H:i:s" );
                $insert_data['created']      = $result->user_id;
                $this->db->insert( 'm_staffs', $insert_data );
            } else {
                $insert_data['updated_date'] = date( "Y-m-d H:i:s" );
                $insert_data['updated']      = $result->user_id;

                $this->db->where( 'id', $id );
                $this->db->update( 'm_staffs', $insert_data );
            }
            $this->db->trans_complete();

            $dataDB['status']  = "success";
            $dataDB['message'] = "";
            $dataDB['data']    = $insert_data;
        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }
        $this->response( $dataDB, 200 );
    }
}
