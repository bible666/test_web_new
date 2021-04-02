<?php
namespace App\Models;

use CodeIgniter\Model;

class PrgExaminersFraAModel extends Model {

    protected $table      = 'prg_examiners_fra_a';
    protected $primaryKey = 'id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'object';
    protected $useSoftDeletes = true;

    protected $allowedFields = [
        'examiner_id',
        'exam_date',
        'question_1',
        'question_2',
        'question_3',
        'question_4',
        'question_5',
        'question_6',
        'question_7',
        'question_8',
        'question_9',
        'question_10',
        'question_11',
        'question_12',
        'question_13',
        'question_14',
        'question_15',
        'question_16',
        'question_17',
        'question_18',
        'question_19',
        'question_20',
        'question_21',
        'question_22',
        'question_23',
        'question_24',
        'question_25',
        'height',
        'weight',
        'bmi',
        'remark',
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
        'examiner_id'     => 'required|integer',
        'exam_date'       => 'required|valid_date'
    ];
    
    protected $validationMessages = [
       
    ];
    protected $skipValidation     = false;

    protected $protectFields = false;

}
?>