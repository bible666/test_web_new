<?php
namespace App\Database\Migrations;

class Migration_mst_user_group_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_user_group 
            (position_code,department_code) 
            VALUES 
            ('001', 'IT'),
			('002', 'IT'),
			('001', 'PURCHASE'),
			('002', 'PURCHASE'),
			('001', 'PLANNING'),
			('002', 'PLANNING'),
			('001', 'SALES'),
			('002', 'SALES'),
			('001', 'TRANSPORT'),
			('002', 'TRANSPORT'),
			('001', 'WH'),
			('002', 'WH'),
			('001', 'STORE'),
			('002', 'STORE'),
			('001', 'PLANNING'),
			('002', 'PLANNING'),
			('001', 'QA'),
			('002', 'QA')
        ");
    }

    public function down()
    {
		$this->db->query("

		DELETE FROM mst_user_group
		");
    }
}
?>