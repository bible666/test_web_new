<?php
namespace App\Database\Migrations;

class Migration_sys_menu_type extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE sys_menu_type(
				menu_type_flag        varchar(1) PRIMARY KEY,
				menu_type_desc      text
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('sys_menu_type');
    }
}
?>