<?php
namespace App\Database\Migrations;

class Migration_mst_department extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_department(
				department_code varchar(50) PRIMARY KEY,
                department_name varchar(100) not null,
                remark varchar(200) not null DEFAULT '',
				active_flag int not null,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user_group');
    }
}
?>