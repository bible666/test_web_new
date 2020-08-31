<?php
namespace App\Controllers;

use Config\App;

class UnitController extends Origin001
{
    protected $format = 'json';

    protected $mst_unit;
    protected $mst_item;

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

        $this->mst_unit = $this->db->table( 'mst_unit' );
        $this->mst_item = $this->db->table( 'mst_item' );

    }

    /**
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token     = $this->getAuthHeader();
        $unit_code = isset( $data->unit_code ) ? $data->unit_code : -1;

        //check unit have use on item
        $item_data = $this->mst_item->getWhere( ['unit_code' => $unit_code, 'active_flag' => true] )->getRow();
        if ( isset( $item_data ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "unit code นี้มีการใช้แล้วในข้อมูลวัตถุดิบไม่สามารถลบได้";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

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

        $this->mst_unit->update( $insert_data, ['unit_code' => $unit_code] );

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
        $unit_code = isset( $data->unit_code ) ? $data->unit_code : -1;

        $result = $this->_checkToken( $token );

        if ( !isset( $result ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, TOKEN_NOT_FOUND );
        }

        $query_str = "
        SELECT *
        FROM mst_unit
        WHERE unit_code = :unit_code:
            AND active_flag = true
        ";

        $itemn_data = $this->db->query( $query_str, ['unit_code' => $unit_code] )->getRow();

        if ( $this->db->error()['message'] !== '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = $this->db->error()['message'];
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        $dataDB['status']  = "success";
        $dataDB['message'] = $query_str;
        $dataDB['data']    = $itemn_data;

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

                case "unit_code":
                    $strCond .= " LOWER(unit_code) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
                    break;
                case "unit_name":
                    $strCond .= " LOWER(unit_name) like '%" . strtolower( $val ) . "%' AND \n"; // placeholders
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
            FROM mst_unit
            WHERE " . $strCond . " active_flag = true
            ORDER BY unit_code
            LIMIT {$limit} OFFSET {$offset}
            ";
            //print_r($query_str);exit;
            $query_count = "
            SELECT count(unit_code) as my_count
            FROM mst_unit
            WHERE " . $strCond . " active_flag = true
            ORDER BY unit_code
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
        $old_unit_code = isset( $data->old_unit_code ) ? trim( $data->old_unit_code ) : '';

        $unit_code = isset( $data->unit_code ) ? trim( $data->unit_code ) : '';
        $unit_name = isset( $data->unit_name ) ? trim( $data->unit_name ) : '';

        $remark = isset( $data->remark ) ? trim( $data->remark ) : '';

        //Validation Data
        if ( $unit_code == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุรหัสหน่วย";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $unit_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณาระบุชื่อหน่วย";
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

            if ( $this->is_dupplicate_data( $old_unit_code, $unit_code ) ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = "รหัสนี้ใช้งานแล้ว";
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );

            }

            //check have unactive in database
            if ( $old_unit_code == -1 ) {
                $old_data = $this->mst_unit->getWhere( ['unit_code' => $unit_code, 'active_flag' => false] )->getRow();
                if ( isset( $old_data ) ) {
                    $old_unit_code = $old_data->unit_code;
                }
            }
            $insert_data = [];

            //$insert_data['m_company_id']    = $result->company_id;

            //set data to array for add or update
            $insert_data['unit_code']   = $unit_code;
            $insert_data['unit_name']   = $unit_name;
            $insert_data['remark']      = $remark;
            $insert_data['active_flag'] = true;

            $this->db->transStart();

            if ( $old_unit_code == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_unit->insert( $insert_data );
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_unit->update( $insert_data, ['unit_code' => $old_unit_code] );
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
    private function is_dupplicate_data( $old_unit_code, $unit_code )
    {
        $is_check = true;

        if (  ( $old_unit_code == $unit_code ) ) {
            return false; // OK data
        }

        $data = $this->mst_unit->getWhere( [
            'unit_code'    => $unit_code,
            'unit_code !=' => $old_unit_code,
            'active_flag'  => true,
        ] )->getRow();

        if ( isset( $data ) ) {

        } else {
            $is_check = false;
        }

        return $is_check;
    }
}
