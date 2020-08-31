<?php
namespace App\Database\Migrations;

class Migration_mst_menu_permission extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_menu_permission(
				id                INT AUTO_INCREMENT PRIMARY KEY,
				menu_id           INT not null REFERENCES sys_menu(menu_id),
				user_group_id     int not null REFERENCES mst_user_group (user_group_id),
				permission_flag   varchar(1) not null DEFAULT '',

				create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_menu_permission');
    }
}
?>