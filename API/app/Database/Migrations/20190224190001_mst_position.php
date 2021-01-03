<?php
namespace App\Database\Migrations;

class Migration_mst_position extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_position(
                position_code varchar(5) PRIMARY KEY COMMENT 'รหัสตำแหน่ง',
                position_name varchar(100) not null DEFAULT '' COMMENT 'ชื่อตำแหน่ง',
                remark varchar(200) not null DEFAULT '' COMMENT 'หมายเหตุ',
                active_flag int DEFAULT 1 COMMENT '1 = true , 0 = false',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL DEFAULT 1,
                update_user INT 
            )
            COMMENT 'ข้อมูลตำแหน่ง';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_position');
    }
}
?>