<?php
namespace App\Database\Migrations;

class Migration_prg_examiners extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE prg_examiners(
            id                  INT AUTO_INCREMENT PRIMARY KEY,
            area_id             INT         NOT NULL                        COMMENT 'id พื้นที่ดูแล' REFERENCES mst_areas(id),
            examiner_code       text        NOT NULL DEFAULT ''             COMMENT 'รหัสผู้ทดสอบ',
            first_name          text        NOT NULL                        COMMENT 'ชื่อ',
            last_name           text                                        COMMENT 'นามสกุล',
            birthdate           date        NOT NULL                        COMMENT 'วันเดือนปีเกิด',
            gender              varchar(1)  NOT NULL                        COMMENT 'เพศ',
            prefectures         INT         NOT NULL                        COMMENT 'จังหวัด',
            address             text        NOT NULL DEFAULT ''             COMMENT 'ที่อยู่',
            remarks             text        NOT NULL DEFAULT ''             COMMENT 'หมายเหตุ',
            active_flag         int DEFAULT 1 COMMENT '1 = true , 0 = false',
            create_date         DATETIME    NOT NULL DEFAULT                CURRENT_TIMESTAMP,
            update_date         DATETIME ,
            create_user         INT         NOT NULL,
            update_user         INT
        );
        ");

    }

    
    public function down()
    {
        $this->dbforge->drop_table('prg_examiners');
    }}
?>