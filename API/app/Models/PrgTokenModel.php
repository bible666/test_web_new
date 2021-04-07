<?php
namespace App\Models;

use CodeIgniter\Model;

class PrgTokenModel extends Model {

    protected $table      = 'prg_token';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'object';
    protected $useSoftDeletes = true;

    protected $allowedFields = [
        'user_id',
        'token_code',
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
        'user_id'       => 'required',
        'token_code'    => 'required'
    ];
    
    protected $validationMessages = [
       
    ];
    protected $skipValidation     = false;

    protected $protectFields = false;

}
?>