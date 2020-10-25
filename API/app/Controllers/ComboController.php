<?php
namespace App\Controllers;

use Config\App;

class ComboController extends Origin001
{

    public function get_unit() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        $http_code = 200;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT unit_code as value_code, unit_name as display_code
        FROM mst_unit
        WHERE active_flag = true AND unit_code = :unit_code:
        ORDER BY unit_code asc";

        $itemn_data = $this->db->query( $query_str, ['unit_code' => $data] )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $itemn_data;

        return $this->respond( $dataDB, $http_code );
    }

    public function get_unit_list() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        $http_code = 200;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT unit_code as value_code, unit_name as display_code
        FROM mst_unit
        WHERE active_flag = true AND ( unit_code like :unit_code: OR unit_name like :unit_code: )
        ORDER BY unit_code asc
        LIMIT 5";

        $itemn_data = $this->db->query( $query_str, ['unit_code' => "%".$data."%"] )->getResult();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, $http_code );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        $dataDB['data']    = $itemn_data;

        return $this->respond( $dataDB, $http_code );
    }

}
