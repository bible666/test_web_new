<?php
namespace App\Database\Migrations;

class Migration_mst_user_group extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user_group(
                user_group_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'รหัสการจัดการ menu',
                department_code varchar(50) COMMENT 'รหัสแผนก อ้างอิง mst_department' REFERENCES mst_department(department_code) ,
                position_code varchar(5) not null DEFAULT '' COMMENT 'รหัสตำแหน่ง' REFERENCES mst_position(position_code),
                remark varchar(200) not null DEFAULT '' COMMENT 'หมายเหตุ',
                active_flag int DEFAULT 1 COMMENT '1 = true , 0 = false',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL DEFAULT 1,
                update_user INT 
            )
            COMMENT 'ข้อมูล menu';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>