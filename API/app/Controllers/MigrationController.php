<?php
// defined('BASEPATH') OR exit('No direct script access allowed');
// require('Origin001.php');
namespace App\Controllers;


class MigrationController extends \CodeIgniter\Controller
{
    public function index(){
        echo "1";
        $migrate = \Config\Services::migrations();

        try
        {
            $migrate->latest();
            echo "ok";
        }
        catch (\Exception $e)
        {
            // Do something with the error here...
            print_r($e);
        }
    }
    // /**
    //  * Constructure class
    //  */
    // // public function __construct()
    // // {
    // //     parent::__construct();
    // //     $this->load->library('migration');

    // // }

    // public function index()
    // {
    //     echo "111";
    //     // if ($this->migration->latest() === FALSE)
    //     // {
    //     //     show_error($this->migration->error_string());
    //     // }
    // }

    // public function to_version_post()
    // {
    //     $data       = $this->post();

    //     //init data
    //     $version      = isset($data['version']) ? $data['version'] : '';
    //     if ($this->migration->latest() === FALSE)
    //     {
    //         show_error($this->migration->error_string());
    //     }
    // }
}
?>