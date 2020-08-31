<?php
namespace App\Database\Migrations;

class Migration_sys_menu extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE sys_menu(
				menu_id           INT AUTO_INCREMENT PRIMARY KEY,
				parent_menu_id    INT REFERENCES sys_menu(menu_id),
				menu_type_flag    varchar(1) NOT NULL REFERENCES sys_menu_type(menu_type),
				menu_name         text,
				menu_short_name   text,
				screen_url        text,
				menu_position     INT
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('sys_menu');
    }
}
?>