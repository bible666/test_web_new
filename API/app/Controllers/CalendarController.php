<?php
namespace App\Controllers;

use Config\App;

class CalendarController extends Origin001
{
    protected $format = 'json';

    protected $mst_calendar;
    protected $mst_calendar_detail;

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

        $this->mst_calendar        = $this->db->table( 'mst_calendar' );
        $this->mst_calendar_detail = $this->db->table( 'mst_calendar_detail' );
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
            $itemn_data = $this->mst_calendar->getWhere( [
                'cal_no'      => $id,
                'active_flag' => true,
            ] )->getRow();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $itemn_data_details = $this->mst_calendar_detail->getWhere( [
                'cal_no'      => $id,
                'active_flag' => true,
            ] )->getResult();

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $itemn_data->holidays = [];
            foreach ( $itemn_data_details as $itemn_data_detail ) {
                $detail = new calenddar_detail();

                $detail->holiday_date   = $itemn_data_detail->cal_date;
                $detail->holiday_name   = $itemn_data_detail->remark;
                $itemn_data->holidays[] = $detail;

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
			FROM mst_calendar
			WHERE " . $strCond . " active_flag = true
			ORDER BY cal_no
			LIMIT {$limit} OFFSET {$offset}
			";
            //print_r($query_str);exit;
            $query_count = "
			SELECT count(cal_no) as my_count
			FROM mst_calendar
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
     * delete data by id
     */
    public function delete_data_by_id()
    {
        $data = $this->request->getJSON();

        //init data
        $token = $this->getAuthHeader();
        $id    = isset( $data->id ) ? $data->id : -1;

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

            $this->mst_calendar->where( [
                'cal_no' => $id,
            ] );
            $this->mst_calendar->update( $insert_data );

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
     *
     */
    private function _is_dupplicate( $cal_no, $cal_name )
    {
        $ret   = false;
        $query = " SELECT * FROM mst_calendar WHERE cal_no <> ? AND cal_name = ? ";
        $data  = $this->db->query( $query, [$cal_no, $cal_name] )->getRow();
        if ( isset( $data ) ) {
            $ret = true;
        }

        return $ret;
    }
    /**
     * insert / update  data
     */
    public function update_data()
    {
        $data = $this->request->getJSON();

        $token    = $this->getAuthHeader();
        $id       = isset( $data->id ) ? trim( $data->id ) : '';
        $cal_name = isset( $data->cal_no ) ? trim( $data->cal_no ) : '';
        $remark   = isset( $data->remark ) ? trim( $data->remark ) : '';
        $holidays = isset( $data->holidays ) ? $data->holidays : [];

        //validate data
        if ( $cal_name == '' ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "กรุณากรอกชื่อปฏิทิน";
            $dataDB['data']    = "";

            return $this->respond( $dataDB, 200 );
        }

        if ( $this->_is_dupplicate( $id, $cal_name ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "มีการใช้ชื่อปฏิทินนี้แล้วในระบบ";
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

        if ( $result->user_id > 0 ) {
            $this->db->transStart();

            $insert_data = [];

            //set data to array for add or update
            $insert_data['cal_name']    = $cal_name;
            $insert_data['active_flag'] = true;
            $insert_data['remark']      = $remark;

            if ( $id == '-1' ) {
                $insert_data['create_date'] = date( "Y-m-d H:i:s" );
                $insert_data['create_user'] = $result->user_id;
                $this->mst_calendar->insert( $insert_data );
                $id = $this->db->insertID();
            } else {
                $insert_data['update_date'] = date( "Y-m-d H:i:s" );
                $insert_data['update_user'] = $result->user_id;

                $this->mst_calendar->where( 'cal_no', $id );
                $this->mst_calendar->update( $insert_data );
            }

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            $this->mst_calendar_detail->delete( ['cal_no' => $id] );

            if ( $this->db->error()['message'] !== '' ) {
                $dataDB['status']  = "error";
                $dataDB['message'] = $this->db->error()['message'];
                $dataDB['data']    = "";

                return $this->respond( $dataDB, 200 );
            }

            foreach ( $holidays as $holiday ) {
                $ar_holidays                 = [];
                $ar_holidays['cal_no']       = $id;
                $ar_holidays['cal_date']     = $holiday->holiday_date;
                $ar_holidays['holiday_flag'] = true;
                $ar_holidays['active_flag']  = true;
                $ar_holidays['remark']       = trim( $holiday->holiday_name );
                $ar_holidays['create_date']  = date( "Y-m-d H:i:s" );
                $ar_holidays['create_user']  = $result->user_id;
                $this->mst_calendar_detail->insert( $ar_holidays );

                if ( $this->db->error()['message'] !== '' ) {
                    $dataDB['status']  = "error";
                    $dataDB['message'] = $this->db->error()['message'];
                    $dataDB['data']    = "";

                    return $this->respond( $dataDB, 200 );
                }
            }

            $this->db->transComplete();

            $dataDB['status']  = "success";
            $dataDB['message'] = "บันทึกสำเร็จ";
            $dataDB['data']    = $insert_data;
        } else {
            $dataDB['status']  = "error";
            $dataDB['message'] = "token not found";
            $dataDB['data']    = "";
        }

        return $this->respond( $dataDB, 200 );

    }

}

class calenddar_detail
{
    public $holiday_date;
    public $holiday_name;
    public $show_date;
}
