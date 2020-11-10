<?php 
namespace App\Controllers;

use CodeIgniter\Controller;

class test extends Controller
{
    public function index()
    {
        $filepath = 'C:\xampp\htdocs\test_web_new\test_web_new\API\writable\uploads\1.jpg';
        if(file_exists($filepath)){ 
            $mime = mime_content_type($filepath); //<-- detect file type
            header('Content-Length: '.filesize($filepath)); //<-- sends filesize header
            header("Content-Type: $mime"); //<-- send mime-type header
            header('Content-Disposition: inline; filename="'.$filepath.'";'); //<-- sends filename header
            readfile($filepath); //<--reads and outputs the file onto the output buffer
            die(); //<--cleanup
            exit; //and exit
          }

    }

    public function test(){
        echo '<img src="http://localhost/test_web_new/test_web_new/API/index.php/test" alt="Italian Trulli">';
        echo '<button>test</button>';
    }
}


?>