<?php
namespace App\Database\Migrations;

class Migration_mst_user extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user(
                user_id           INT AUTO_INCREMENT PRIMARY KEY,
                title_code        varchar(3) COMMENT 'คำนำหน้าชื่อ อ้างอิง mst_title' REFERENCES mst_title (title_code),
                first_name        varchar(200) DEFAULT '' COMMENT 'ชื่อ',
                last_name         varchar(200) DEFAULT '' COMMENT 'นามสกุล',
                join_date         date COMMENT 'วันที่เริ่มงาน',
                birthday          date COMMENT 'วันเกิด',
                employee_id       VARCHAR(50) DEFAULT '' COMMENT 'รหัสพนักงาน',
                login_id	      VARCHAR(100) NOT NULL,
                user_password     VARCHAR(200) NOT NULL,
                department_code   VARCHAR(50) COMMENT 'แผนกที่สังกัด อ้างอิง mst_department' REFERENCES mst_department (department_code),
                position_code     VARCHAR(5)  COMMENT 'ตำแหน่ง อ้างอิง mst_position' REFERENCES mst_position (position_code),
                id_card           varchar(20) DEFAULT '' COMMENT 'เลขที่บัตรประชาชน',
                tax_id            varchar(20) DEFAULT '' COMMENT 'รหัสผู้เสียภาษี',
                social_id         varchar(20) DEFAULT '' COMMENT 'รหัสประกันสังคม',
                education_level   varchar(20) DEFAULT '' COMMENT 'ระดับการศึกษา',
                field_of_study    varchar(50) DEFAULT '' COMMENT 'คณะ หรือ วิชา',
                institution       varchar(100) DEFAULT '' COMMENT '',
                gpa               varchar(10) DEFAULT '' COMMENT 'เกรดเฉลี่ยที่จบการศึกษา',
                address           varchar(1000) DEFAULT '' COMMENT 'ที่อยู่',
                phone             varchar(50) DEFAULT '' COMMENT 'เบอร์โทร',
                mobile            varchar(50) DEFAULT '' COMMENT 'เบอร์มือถือ',
                e_mail            varchar(50) DEFAULT '' COMMENT 'E-Mail',
                reference_name    varchar(200) DEFAULT '' COMMENT 'ชื่อบุคคลอ้างอิง',
                reference_phone   varchar(50) DEFAULT '' COMMENT 'เบอร์โทรบุคคลอ้างอิง',
                bank_name         varchar(100) DEFAULT '' COMMENT 'ชื่อธนาคารที่จะโอนเงิน',
                bank_account      varchar(50) DEFAULT '' COMMENT 'เลขที่บัญชีที่จะโอนเงิน',

                salary            decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT 'เงินเดือน',
                ot_1              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT 'OT 1',
                ot_2              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT 'OT 2',
                ot_3              decimal(18,5) NOT NULL DEFAULT 0.00 COMMENT 'OT 3',

                remark            varchar(200) DEFAULT '' COMMENT 'หมายเหตุ',
                active_flag       int DEFAULT 1 COMMENT '1 = true , 0 = false',
                last_login_time   DATETIME COMMENT 'login เข้าใช้งานระบบครั้งสุดท้าย',
                last_ng_time      DATETIME COMMENT 'login เข้าใช้งานระบบผิดพลาดครั้งสุดท้าย',
                ng_count          INT      DEFAULT 0 COMMENT 'จำนวนที่ login ผิดพลาด',
                account_loack     int DEFAULT false COMMENT 'ปิดการใช้งานระบบ 1 = true , 0 = false',

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