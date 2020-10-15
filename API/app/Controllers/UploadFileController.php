<?php
namespace App\Controllers;

use Config\App;

class UploadFileController extends Origin001
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

    }
    
    /**
     * delete data by id
     */
    public function upload_file()
    {
        //$uploads = $this->request->getFiles();
        //print_r($uploads);
        $file = $this->request->getFile('file');
        //print_r($file);
        //print_r(WRITEPATH);
        $file->move(WRITEPATH.'uploads');
        //exit;
        $dataDB['status']  = "success";
        $dataDB['message'] = "";
        //$dataDB['data']    = $data;

        return $this->respond( $dataDB, 200 );
    }

}