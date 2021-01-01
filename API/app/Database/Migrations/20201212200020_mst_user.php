<?php
namespace App\Database\Migrations;

class Migration_mst_user extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user(
                user_id           INT AUTO_INCREMENT PRIMARY KEY,
                title_code        varchar(3) REFERENCES mst_title (title_code),
                first_name        varchar(200) DEFAULT '' COMMENT 'ชื่อ',
                last_name         varchar(200) DEFAULT '' COMMENT 'นามสกุล',
                gender            varchar(1) DEFAULT '' COMMENT 'เพศ 001 ชาย, 002 หญิง',
                join_date         date COMMENT 'วันที่เริ่มงาน',
                birthday          date COMMENT 'วันเกิด',
                employee_id       VARCHAR(50) DEFAULT '' COMMENT 'รหัสพนักงาน',
                login_id	      VARCHAR(100) NOT NULL,
                user_password     VARCHAR(200) NOT NULL,
                department_code   VARCHAR(50) REFERENCES mst_department (department_code),
                user_group_id     int REFERENCES mst_user_group (user_group_id),
                id_card           varchar(20) DEFAULT '' COMMENT 'เลขที่บัตรประชาชน',
                tax_id            varchar(20) DEFAULT '' COMMENT 'รหัสผู้เสียภาษี',
                social_id         varchar(20) DEFAULT '' COMMENT 'รหัสประกันสังคม',
                education_level   varchar(20) DEFAULT '' COMMENT 'ระดับการศึกษา',
                field_of_study    varchar(50) DEFAULT '' COMMENT 'คณะ หรือ วิชา',
                institution       varchar(100) DEFAULT '' COMMENT '',
                gpa               varchar(10) DEFAULT '' COMMENT 'เกรดเฉลี่ยที่จบการศึกษา',
                address           varchar(1000) DEFAULT '' COMMENT 'ที่อยู่',
                province          varchar(100) DEFAULT '' COMMENT 'จังหวัด',
                post_code         varchar(50) DEFAULT '' COMMENT '',
                phone             varchar(50) DEFAULT '' COMMENT '',
                mobile            varchar(50) DEFAULT '' COMMENT '',
                e_mail            varchar(50) DEFAULT '' COMMENT '',
                reference_name    varchar(200) DEFAULT '' COMMENT '',
                reference_phone   varchar(50) DEFAULT '' COMMENT '',
                bank_name         varchar(100) DEFAULT '' COMMENT '',
                bank_account      varchar(50) DEFAULT '' COMMENT '',

                salary            decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT '',
                ot_1              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT '',
                ot_2              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT '',
                ot_3              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT '',

                remark            varchar(200) DEFAULT '' COMMENT '',
                active_flag       int DEFAULT 1 COMMENT '1 = true , 0 = false',
                last_login_time   DATETIME COMMENT '',
                last_ng_time      DATETIME COMMENT '',
                ng_count          INT      DEFAULT 0 COMMENT '',
                account_loack     int DEFAULT false COMMENT '',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
            COMMENT 'ข้อมูลพนักงาน';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user');
    }
}
?>