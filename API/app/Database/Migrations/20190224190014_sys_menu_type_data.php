<?php
namespace App\Database\Migrations;

class Migration_mst_menu_type_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
		INSERT INTO sys_menu_type 
		(menu_type_flag, menu_type_desc) 
		VALUES 
		('M','Menu'),
		('S','Screen')

        ");
    }

    public function down()
    {
        $this->db->query("

		DELETE FROM sys_menu_type
		");
    }
}
?>