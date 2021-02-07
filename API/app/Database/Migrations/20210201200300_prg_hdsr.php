<?php
namespace App\Database\Migrations;

class Migration_prg_hdsr extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_examiners_hdsr(
                id              INT AUTO_INCREMENT PRIMARY KEY,
                examiner_id     INT    NOT NULL REFERENCES examiners(id)    COMMENT 'id คนทดสอบ',
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
                question_13     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 13',
                question_14     INT    NOT NULL DEFAULT 0                   COMMENT 'คำถาม 14',
                remark          text,
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลการทดสอบ HDSR';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_examiners_hdsr');
    }
}
?>