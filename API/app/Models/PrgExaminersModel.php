<?php
namespace App\Models;

use CodeIgniter\Model;

class PrgExaminersModel extends Model {

    protected $table      = 'prg_examiners';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $allowedFields = [
        'area_id',
        'examiner_code',
        'first_name',
        'last_name',
        'birthdate',
        'gender',
        'prefectures',
        'address',
        'remarks',
        'active_flag',
        'create_date',
        'update_date',
        'create_user',
        'update_user'
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'create_date';
    protected $updatedField  = 'update_date';

    protected $validationRules    = [
        'examiner_code'  => 'is_unique[prg_examiners.examiner_code,id,{id}]',
        'first_name'     => 'required',
        'gender'         => 'max_length[1]'
    ];
    
    protected $validationMessages = [
       'gender' => [
           'max_length' => 'ห้ามยาวเกิน 1 ตัวอักษร'
       ]
    ];
    protected $skipValidation     = false;

    protected $protectFields = false;

}
?>