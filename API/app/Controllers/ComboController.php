<?php
namespace App\Controllers;

use Config\App;

class ComboController extends Origin001{

    public function get_unit() {
        $token     = $this->getAuthHeader();
        $data      = $this->request->getJSON();
        $http_code = 200;

        $query_str = " SELECT unit_code as value_code, unit_name as display_code FROM mst_unit where active_flag = true order by unit_code asc";

        $itemn_data = $this->db->query( $query_str )->getResult();

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

?>