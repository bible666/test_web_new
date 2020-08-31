<?php
namespace App\Controllers;

use Config\App;

class UserController extends Origin001
{
    protected $format = 'json';

    protected $mst_user_table;
    protected $prg_token;

    public function initController( \CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger )
    {

        // Do Not Edit This Line
        parent::initController( $request, $response, $logger );

        //--------------------------------------------------------------------
        // Preload any models, libraries, etc, here.
        //--------------------------------------------------------------------
        // E.g.:
        // $this->session = \Config\Services::session();

        $this->mst_user_table = $this->db->table( 'mst_user' );
        $this->prg_token      = $this->db->table( 'prg_token' );
    }

    public function login()
    {

        $data = $this->request->getJSON();

        $headers = [];
        foreach ( getallheaders() as $name => $value ) {
            $headers[$name] = $value;
        }

        //init data
        $token         = '';

        $dataDB['status']  = "error";
        $dataDB['message'] = "";
        $dataDB['data']    = "";

        //Get Data From Post
        $user_login    = isset( $data->user_login ) ? $data->user_login : '';
        $user_password = isset( $data->user_password ) ? $data->user_password : '';

        $sql = "SELECT * FROM mst_user WHERE login_id = :login: AND active_flag = true";

        $query = $this->db->query( $sql, ['login' => $user_login] );
        $row   = $query->getRow();

        if ( !isset( $row ) ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = "ไม่สามารถเข้าใช้งานระบบได้ login หรือ password ผิดพลาด";
            $dataDB['data']    = "";
            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }
        
        //$my = $this->encryption->decrypt($row['staff_pwd']);
        //if ($user_password == $this->encryption->decrypt($row['staff_pwd'])) {

        $nowData   = strtotime( date( "Y-m-d H:i:s" ) );
        $diff_time = round( abs( $nowData - strtotime( $row->last_ng_time ) ) / 60, 2 );

        if ( $row->ng_count >= MAX_LOGIN_COUNT && $diff_time <= MAX_LOCK_LOGIN_TIME_MINIUS ) {
            $dataDB['status']  = "error";
            $dataDB['message'] = 'คุณ login เกินจำนวนครั้งที่กำหนด กรุณาลองใหม่อีกครั้งหลังผ่าน '.MAX_LOCK_LOGIN_TIME_MINIUS.' นาที';
            $dataDB['data']    = "";
            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        if ( $user_password != $row->user_password ) {
            $user_update = [
                'last_ng_time' => date( "Y-m-d H:i:s" ),
                'update_date'  => date( "Y-m-d H:i:s" ),
                'ng_count'     => $row->ng_count + 1,
            ];
            $this->mst_user_table->where( 'user_id', $row->user_id );
            $this->mst_user_table->update( $user_update );

            $dataDB['status']  = "error";
            $dataDB['message'] = "ไม่สามารถเข้าใช้งานระบบได้ login หรือ password ผิดพลาด";
            $dataDB['data']    = "";
            return $this->respond( $dataDB, HTML_STATUS_UNAUTHORIZED );
        }

        $token = $this->_getGUID();

        $staff_id = $row->user_id;

        //Clear Old Token Data
        $data = ['active_flag' => false];
        $this->prg_token->where( ['user_id' => $staff_id, 'active_flag' => false] );
        $this->prg_token->update( $data );

        //insert New Token Data
        $TokenData['user_id']     = $staff_id;
        $TokenData['token_code']  = $token;
        $TokenData['active_flag'] = true;
        $TokenData['create_date'] = date( "Y-m-d H:i:s" );
        $this->prg_token->insert( $TokenData );

        //update user table
        $data = [
            'update_date'     => date( "Y-m-d H:i:s" ),
            'last_login_time' => date( "Y-m-d H:i:s" ),
            'last_ng_time'    => null,
            'ng_count'        => 0,
        ];
        $this->mst_user_table->where( 'user_id', $row->user_id );
        $this->mst_user_table->update( $data );

        //Get Menu Data
        $sql = "
        SELECT sm.*,mmp.permission_flag
        FROM mst_menu_permission mmp inner join sys_menu sm on mmp.menu_id  =  sm.menu_id
        WHERE mmp.user_group_id = :user_group_id:";

        $menu_data = $this->db->query( $sql, ['user_group_id' => $row->user_group_id] )->getResult();

        $result['token'] = $token;

        $dataDB['status']   = "success";
        $dataDB['message']  = "";
        $dataDB['data']     = $result;
        $dataDB['menuData'] = $menu_data;
        return $this->respond( $dataDB, HTML_STATUS_SUCCESS );

    }

    private function _getGUID()
    {
        mt_srand( (double) microtime() * 10000 ); //optional for php 4.2.0 and up.
        $charid = strtoupper( md5( uniqid( rand(), true ) ) );
        $hyphen = chr( 45 ); // "-"
        $uuid   = substr( $charid, 0, 8 )
        . substr( $charid, 8, 4 )
        . substr( $charid, 12, 4 )
        . substr( $charid, 16, 4 )
        . substr( $charid, 20, 12 ); // "}"

        return $uuid;
    }
}
