<?php
namespace App\Database\Migrations;

class Migration_prg_senior extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_examiners_senior(
                id                  INT AUTO_INCREMENT PRIMARY KEY,
                examiner_id         INT    NOT NULL REFERENCES examiners(id)    COMMENT 'id คนทดสอบ',
                exam_date           date   NOT NULL                             COMMENT 'วันที่ทดสอบ',
                healt_condition_01  INT NOT NULL DEFAULT 0,
                mental_help_01      INT NOT NULL DEFAULT 0,
                eating_habit_01     INT NOT NULL DEFAULT 0,
                oral_01             INT NOT NULL DEFAULT 0,
                oral_02             INT NOT NULL DEFAULT 0,
                weight_01           INT NOT NULL DEFAULT 0,
                execise_01          INT NOT NULL DEFAULT 0,
                execise_02          INT NOT NULL DEFAULT 0,
                execise_03          INT NOT NULL DEFAULT 0,
                cognitive_01        INT NOT NULL DEFAULT 0,
                cognitive_02        INT NOT NULL DEFAULT 0,
                smoking_01          INT NOT NULL DEFAULT 0,
                social_01           INT NOT NULL DEFAULT 0,
                social_02           INT NOT NULL DEFAULT 0,
                social_support_01   INT NOT NULL DEFAULT 0,
                remark          text,
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลการทดสอบ senior';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_examiners_senior');
    }
}
?>