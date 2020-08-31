<?php
namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class Origin001 extends ResourceController
{
    protected $db;
    protected $prg_token_origin;

    /**
     * Constructor.
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
        $this->db = \Config\Database::connect();
        $this->prg_token_origin      = $this->db->table( 'prg_token' );

        header( 'Access-Control-Allow-Origin: *' );
        header( "Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization" );
        header( "Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE" );
        $method = $_SERVER['REQUEST_METHOD'];
        if ( $method == "OPTIONS" ) {
            die();
        }
        
    }

    /**
     * get menu perission for user
     *
     * @param $menuId id from table m_menu_controls
     * @param $userType user category
     *
     * @return int
     */
    protected function _getMenuPermission( $menuId, $userType )
    {
        $permission = -1;
        $this->db->select( 'm_permission_id' );
        $dataRow = $this->db->get_where( 'm_menu_staff_category', [
            'm_menu_control_id'   => $menuId,
            'm_staff_category_id' => $userType,
        ] )->row();

        if ( isset( $dataRow ) ) {
            $permission = $dataRow->m_permission_id;
        }

        return $permission;
    }

    /**
     * check token is ok and get staff data
     *
     * @param $token user token
     *
     * @return check_token_class
     */
    protected function _checkToken( $token )
    {

        $query_str = "
            SELECT s.*,t.id as token_code,t.active_flag,
                CASE WHEN t.update_date IS NULL THEN t.create_date ELSE t.update_date END as token_update
            FROM prg_token t INNER JOIN mst_user s ON t.user_id = s.user_id
            WHERE t.token_code = :token:
                AND t.active_flag = true
        ";

        $staff_data = $this->db->query( $query_str, ['token' => $token] )->getRow();

        $tokenData = new check_token_class();

        if ( !isset( $staff_data ) ) {
            return null;
        }

        $minDiff = $this->dateDifference( $staff_data->token_update, date( "Y-m-d H:i:s" ), '%i' );

        if ( $minDiff >= TOKEN_LIVE_TIME_MINIUS ) {
            //update token data
            //Clear Old Token Data
            $data = ['active_flag' => false];
            $this->prg_token_origin->where( ['token_code' => $token] );
            $this->prg_token_origin->update( $data );

            return null;
        }

        $tokenData->status     = $staff_data->active_flag;
        $tokenData->user_id    = $staff_data->user_id;
        $tokenData->staff_name = $staff_data->first_name;
        $tokenData->company_id = 0;
        $tokenData->staff_cat  = $staff_data->user_group_id;

            //update token data
            $data = ['update_date' => date( "Y-m-d H:i:s" )];
            $this->prg_token_origin->where( ['token_code' => $token] );
            $this->prg_token_origin->update( $data );
            //     $this->db->set(['update_date' => date("Y-m-d H:i:s")]);
            //     $this->db->where(['id' => $staff_data->token_code]);
            //     $this->db->update('prg_token');

        //echo $minDiff;
        //if ($staff_data->token_update > date("Y-m-d H:i:s"))


        return $tokenData;
    }

    protected function getAuthHeader()
    {

        $headers = [];
        foreach ( getallheaders() as $name => $value ) {
            $headers[$name] = $value;
        }
        if ( isset( $headers['Authorization'] ) ) {
            return $headers['Authorization'];
        } else {
            return '';
        }
    }

    //////////////////////////////////////////////////////////////////////
    //PARA: Date Should In YYYY-MM-DD Format
    //RESULT FORMAT:
    // '%y Year %m Month %d Day %h Hours %i Minute %s Seconds'    =>  1 Year 3 Month 14 Day 11 Hours 49 Minute 36 Seconds
    // '%y Year %m Month %d Day'                                =>  1 Year 3 Month 14 Days
    // '%m Month %d Day'                                        =>  3 Month 14 Day
    // '%d Day %h Hours'                                        =>  14 Day 11 Hours
    // '%d Day'                                                        =>  14 Days
    // '%h Hours %i Minute %s Seconds'                                =>  11 Hours 49 Minute 36 Seconds
    // '%i Minute %s Seconds'                                        =>  49 Minute 36 Seconds
    // '%h Hours                                                    =>  11 Hours
    // '%a Days                                                        =>  468 Days
    //////////////////////////////////////////////////////////////////////
    protected function dateDifference( $date_1, $date_2, $differenceFormat = '%a' )
    {
        $datetime1 = date_create( $date_1 );
        $datetime2 = date_create( $date_2 );

        $interval = date_diff( $datetime1, $datetime2 );

        return $interval->format( $differenceFormat );

    }

    public function checkFormatDate( $date01 )
    {
        if ( preg_match( "/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/", $date01 ) ) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * example for create pdf file
     *
     * @param $data data for send to pdf
     *
     * @return bool
     */
    public function Create_PDF( $data )
    {

        // ob_start();

        // $filename = "order.pdf";

        // $namePDF = $data['Booking_No_PDF'];
        // $html = $this->load->view('PDF',$data,true);
        // // echo($html);
        //  ob_end_clean();

        // $this->load->library('M_pdf');

        // $a = new M_pdf();

        // $a->pdf->WriteHTML($html);
        // // $a->pdf->Output();

        // if($a->pdf->Output("./PDFBooking/".$namePDF,"F")){

        // } else if($data['donotSendmail']<=0){
        //     // print_r("1");
        //     return true;
        //     // $messagex= $this->sendMail($data['reservation_id'],$data['user_id']);
        //     // print_r("2");
        // }

        return false;
    }

    public function transaction_save( $doc_type, string $doc_no,
        string $factory_code, string $location_code, string $item_code, string $lot_no,
        $first_receive_date, $quantity, $unit_price ) {

        $prg_stock_transaction = $this->db->table( 'prg_stock_transaction' );
        $prg_stock             = $this->db->table( 'prg_stock' );

        $insert_data['doc_type']           = $doc_type;
        $insert_data['doc_no']             = $doc_no;
        $insert_data['factory_code']       = $factory_code;
        $insert_data['location_code']      = $location_code;
        $insert_data['item_code']          = $item_code;
        $insert_data['lot_no']             = $lot_no;
        $insert_data['first_receive_date'] = $first_receive_date;
        $insert_data['quantity']           = $quantity;
        $insert_data['unit_price']         = $unit_price;
        $insert_data['remark']             = '';

        //insert transaction
        $prg_stock_transaction->insert( $insert_data );

        //get old data from stock
        $old_data = $prg_stock->getWhere( ['factory_code' => $factory_code, 'location_code' => $location_code, 'item_code' => $item_code, 'lot_no' => $lot_no, 'first_receive_date' => $first_receive_date] )->getRow();
        if ( isset( $old_data ) ) {
            //have data will update
            $update_data['quantity'] = $old_data->quantity + $quantity;
            $prg_stock->update( $update_data, ['factory_code' => $factory_code, 'location_code' => $location_code, 'item_code' => $item_code, 'lot_no' => $lot_no, 'first_receive_date' => $first_receive_date] );
        } else {
            //not data will insert
            $prg_stock->insert( $insert_data );
        }

        return true;
    }

}

class stock_transaction_type
{
    const ISSUE    = 'issue';
    const RECEIVE  = 'receive';
    const TRANSFER = 'transfer';
}

class db_class
{
    public $status  = '';
    public $message = '';
    public $data    = [];
}

class check_token_class
{
    public $status     = '';
    public $user_id    = '';
    public $staff_name = '';
    public $company_id = -1;
    public $staff_cat  = -1;
}

abstract class menuPermission
{
    const error = -1;
    const read  = 1;
    const write = 2;
}

if ( !function_exists( 'getallheaders' ) ) {
    function getallheaders()
    {
        $headers = [];
        foreach ( $_SERVER as $name => $value ) {
            if ( substr( $name, 0, 5 ) == 'HTTP_' ) {
                $headers[str_replace( ' ', '-', ucwords( strtolower( str_replace( '_', ' ', substr( $name, 5 ) ) ) ) )] = $value;
            }
        }

        return $headers;
    }
}
