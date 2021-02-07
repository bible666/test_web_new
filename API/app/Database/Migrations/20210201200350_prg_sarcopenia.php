<?php
namespace App\Database\Migrations;

class Migration_prg_sarcopenia extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_examiners_sarcopenia(
                id              INT AUTO_INCREMENT PRIMARY KEY,
                examiner_id     INT    NOT NULL                             COMMENT 'id คนทดสอบ' REFERENCES examiners(id) ,
                exam_date       date   NOT NULL                             COMMENT 'วันที่ทดสอบ',
                question_1      decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'คำถาม 1',
                question_2      decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'คำถาม 2',
                question_3      decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'คำถาม 3',
                question_4      decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'คำถาม 4',
                question_5      decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'คำถาม 5',
                dxa             decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'dxa',
                bia             decimal(18,5) NOT NULL DEFAULT 0            COMMENT 'bia',
                remark          text,
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลการทดสอบ sarcopenia';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_examiners_sarcopenia');
    }
}
?>