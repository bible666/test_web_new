<?php
namespace App\Database\Migrations;

class Migration_mst_user_group extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user_group(
                user_group_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสกลุ่มลูกค้า',
                user_group_name varchar(100) not null COMMENT 'ชื่อกลุ่มลูกค้า',
                remark varchar(200) COMMENT 'หมายเหตุ',
                active_flag int COMMENT '1 = true , 0 = false',
                department_code varchar(50) REFERENCES mst_department(department_code) COMMENT 'รหัสแผนก อ้างอิง table mst_department',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
            COMMENT 'ข้อมูลกลุ่มพนักงาน';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>