<?php
namespace App\Models;

use CodeIgniter\Model;

class MstUserModel extends Model {

    protected $table      = 'mst_user';
    protected $primaryKey = 'user_id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $allowedFields = [
        'title_code',
        'first_name',
        'last_name',
        'join_date',
        'birthday',
        'employee_id',
        'login_id',
        'user_password',
        'department_code',
        'position_code',
        'id_card',
        'tax_id',
        'social_id',
        'education_level',
        'field_of_study',
        'institution',
        'gpa',
        'address',
        'phone',
        'mobile',
        'e_mail',
        'reference_name',
        'reference_phone',
        'bank_name',
        'bank_account',
        'salary',
        'ot_1',
        'ot_2',
        'ot_3',
        'remark',
        'active_flag',
        'last_login_time',
        'last_ng_time',
        'ng_count',
        'account_loack',
        'create_date',
        'update_date',
        'create_user',
        'update_user'
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'create_date';
    protected $updatedField  = 'update_date';
    //protected $deletedField  = 'user_id';

    protected $validationRules    = [
        'first_name'     => 'required',
        'last_name'      => 'required'
    ];
    
    protected $validationMessages = [
       
    ];
    protected $skipValidation     = false;

    protected $protectFields = false;

}
?>