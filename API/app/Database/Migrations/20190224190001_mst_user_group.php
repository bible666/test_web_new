<?php
namespace App\Database\Migrations;

class Migration_mst_user_group extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user_group(
				user_group_id INT AUTO_INCREMENT PRIMARY KEY,
                user_group_name varchar(100) not null,
                remark varchar(200) ,
				active_flag int,
				department_code varchar(50) REFERENCES mst_department(department_code),

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