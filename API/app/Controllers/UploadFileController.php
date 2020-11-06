<?php
namespace App\Controllers;

use Config\App;

class UploadFileController extends Origin001
{

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
     * upload file
     */
    public function upload_file()
    {
        $file   = $this->request->getFile( 'file' );
        if ( !isset ( $file ) ) {
            $dataDB['status']       = "success";
            $dataDB['message']      = "";
            $dataDB['file_name']    = "";
            //$dataDB['data']    = $data;
    
            return $this->respond( $dataDB, 200 );
        }
        $folder = $this->request->getPost( 'feature' );
        //print_r($file);
        //print_r(WRITEPATH);
        $newName = $file->getRandomName();
        $file->move( WRITEPATH . 'uploads/' . $folder,$newName );
        //exit;
        $dataDB['status']       = "success";
        $dataDB['message']      = "";
        $dataDB['file_name']    = $newName;
        //$dataDB['data']    = $data;

        return $this->respond( $dataDB, 200 );
    }

}
