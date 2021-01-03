<?php
namespace App\Database\Migrations;

class Migration_mst_position_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_position 
            (position_code,position_name) 
            VALUES 
            ('001','ผู้จัดการ'),
			('002','พนักงาน')
        ");
    }

    public function down()
    {
		$this->db->query("

		DELETE FROM mst_position
		");
    }
}
?>