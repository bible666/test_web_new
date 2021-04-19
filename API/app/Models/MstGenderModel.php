<?php
namespace App\Models;

use CodeIgniter\Model;

class MstGenderModel extends Model {

    protected $table      = 'mst_gender';
    protected $primaryKey = 'gender_code';

    protected $useAutoIncrement = true;

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $allowedFields = [
        'gender_name_th',
        'gender_name_en',
        'create_date',
        'update_date',
        'create_user',
        'update_user'
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'create_date';
    protected $updatedField  = 'update_date';


    protected $validationRules    = [
        'gender_name_th'     => 'required'
    ];
    
    protected $validationMessages = [
       
    ];
    protected $skipValidation     = false;

    protected $protectFields = false;

}
?>