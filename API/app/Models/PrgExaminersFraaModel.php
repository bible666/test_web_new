<?php
namespace App\Models;

use CodeIgniter\Model;

class PrgExaminersFraAModel extends Model {

    protected $table      = 'prg_examiners_fra_a';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['examiner_id', 'exam_date',];

    // protected $useTimestamps = false;
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';
    // protected $deletedField  = 'deleted_at';

    // protected $validationRules    = [];
    // protected $validationMessages = [];
    // protected $skipValidation     = false;

    // protected $table        = 'prg_examiners_fra_a';
    // protected $primaryKey   = 'id';

    // //protected $useAutoIncrement = true;

    // protected $returnType     = 'object';
    // //protected $protectFields = false;
    // // protected $useAutoIncrement = true;

    // // protected $returnType     = 'array';
    // // protected $useSoftDeletes = true;

    // protected $allowedFields = ['name', 'email', 'address'];

    // // protected $useTimestamps = false;
    // // protected $createdField  = 'created_at';
    // // protected $updatedField  = 'updated_at';
    // // protected $deletedField  = 'deleted_at';

    // // protected $validationRules    = [];
    // // protected $validationMessages = [];
    // // protected $skipValidation     = false;
    // //protected $validationRules    = [
    // //    'examiner_id'     => 'required',
    // //    'exam_date'       => 'required'
    // //];

    // //protected $validationMessages = [
    // //   
    // //];
}
?>