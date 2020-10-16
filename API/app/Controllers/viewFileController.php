<?php namespace App\Controllers;

use CodeIgniter\Controller;

class viewFileController extends Controller
{

    // public function index()
    // {
    //     //echo 'Hello World!';$this->response->setStatusCode(404, 'Nope. Not here.');
    //     //$this->response->setStatusCode(404, 'Nope. Not here.');
    //     //$image = file_get_contents('/public/assets/uploads/item/20201015032725images.jpg');
    //     $image = \Config\Services::image()
    //     ->withFile('/Applications/MAMP/htdocs/test_web_new/API/public/assets/uploads/item/20201015032725images.jpg');
    //     //return $this->response->download('/writable/uploads/画面設計書-20.xlsx', null);
    //     $this->output->set_output(file_get_contents('/Applications/MAMP/htdocs/test_web_new/API/public/assets/uploads/item/20201015032725images.jpg'));
    //     return $image;
    // }

    public function index()
    {
        echo ROOTPATH;
        echo '<br/>';
        echo SYSTEMPATH;
        echo '<br/>';
        echo WRITEPATH;
        // $filepath = 'C:\xampp\htdocs\test_web_new\test_web_new\API\writable\uploads\1.jpg';
        // if(file_exists($filepath)){ 
        //     $mime = mime_content_type($filepath); //<-- detect file type
        //     header('Content-Length: '.filesize($filepath)); //<-- sends filesize header
        //     header("Content-Type: $mime"); //<-- send mime-type header
        //     header('Content-Disposition: inline; filename="'.$filepath.'";'); //<-- sends filename header
        //     readfile($filepath); //<--reads and outputs the file onto the output buffer
        //     die(); //<--cleanup
        //     exit; //and exit
        //   }

    }
}
