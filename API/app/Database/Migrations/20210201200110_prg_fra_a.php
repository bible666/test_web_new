<?php
namespace App\Database\Migrations;

class Migration_prg_fra_a extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_examiners_fra_a(
                id                  INT AUTO_INCREMENT PRIMARY KEY,
                examiner_id         INT    NOT NULL                             COMMENT 'id คนทดสอบ' REFERENCES examiners(id),
                exam_date           date   NOT NULL                             COMMENT 'วันที่ทดสอบ',
                question_1          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 1',
                question_2          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 2',
                question_3          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 3',
                question_4          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 4',
                question_5          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 5',
                question_6          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 6',
                question_7          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 7',
                question_8          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 8',
                question_9          INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 9',
                question_10         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 10',
                question_11         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 11',
                question_12         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 12',
                question_13         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 13',
                question_14         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 14',
                question_15         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 15',
                question_16         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 16',
                question_17         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 17',
                question_18         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 18',
                question_19         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 19',
                question_20         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 20',
                question_21         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 21',
                question_22         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 22',
                question_23         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 23',
                question_24         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 24',
                question_25         INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 25',
                height              DECIMAL(10,2),
                weight              DECIMAL(10,2),
                bmi                 DECIMAL(10,2),
                living_status       int,
                hypokinesia         int,
                decreased_nutrition int,
                deterioration_mouth int,
                withdrawal          int,
                forget              int,
                depression          int,
                frailty_judgment    int,
                total_score         int,
                remark              text,
                active_flag         int,
                create_date         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date         DATETIME ,
                create_user         INT NOT NULL,
                update_user         INT 
            )
            COMMENT 'ข้อมูลการทดสอบ FRA A';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_examiners_fra_a');
    }
}
?>