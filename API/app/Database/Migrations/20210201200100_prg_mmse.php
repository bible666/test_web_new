<?php
namespace App\Database\Migrations;

class Migration_prg_mmse extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_examiners_mmse(
                id              INT AUTO_INCREMENT PRIMARY KEY,
                examiner_id     INT    NOT NULL                             COMMENT 'id คนทดสอบ' REFERENCES examiners(id),
                exam_date       date   NOT NULL                             COMMENT 'วันที่ทดสอบ',
                question_1      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 1',
                question_2      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 2',
                question_3      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 3',
                question_4      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 4',
                question_5      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 5',
                question_6      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 6',
                question_7      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 7',
                question_8      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 8',
                question_9      INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 9',
                question_10     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 10',
                question_11     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 11',
                question_12     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 12',
                question_12_img text   NOT NULL DEFAULT ''                  COMMENT 'คำถาม 12 รูป',
                question_13     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 13',
                question_14     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 14',
                question_14_img text   NOT NULL DEFAULT ''                  COMMENT 'คำถาม 14 รูป',
                question_15     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 15',
                question_16     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 16',
                question_17     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 17',
                question_18     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 18',
                question_19     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 19',
                question_20     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 20',
                question_21     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 21',
                question_22     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 22',
                remark          text,
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลการทดสอบ mmse';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_examiners_mmse');
    }
}
?>