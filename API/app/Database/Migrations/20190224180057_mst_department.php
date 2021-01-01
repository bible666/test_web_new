<?php
namespace App\Database\Migrations;

class Migration_mst_department extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_department(
                department_code varchar(50) PRIMARY KEY COMMENT 'รหัสแผนก',
                department_name varchar(100) not null COMMENT 'ชื่อแผนก',
                remark varchar(200) not null DEFAULT '' COMMENT 'หมายเหตุ',
                active_flag int not null COMMENT '1 = true , 0 = false',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL DEFAULT 1,
                update_user INT
            )
            COMMENT 'ข้อมูลแผนก';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>