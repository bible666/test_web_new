<?php
namespace App\Database\Migrations;

class Migration_mst_user_group_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_user_group 
            (user_group_code,user_group_name,department_code) 
            VALUES 
            ('001','ผู้จัดการ', 'IT'),
			('002','พนักงาน', 'IT'),
			('001','ผู้จัดการ', 'PURCHASE'),
			('002','พนักงาน', 'PURCHASE'),
			('001','ผู้จัดการ', 'PLANNING'),
			('002','พนักงาน', 'PLANNING'),
			('001','ผู้จัดการ', 'SALES'),
			('002','พนักงาน', 'SALES'),
			('001','ผู้จัดการ', 'TRANSPORT'),
			('002','พนักงาน', 'TRANSPORT'),
			('001','ผู้จัดการ', 'WH'),
			('002','พนักงาน', 'WH'),
			('001','ผู้จัดการ', 'STORE'),
			('002','พนักงาน', 'STORE'),
			('001','ผู้จัดการ', 'PLANNING'),
			('002','พนักงาน', 'PLANNING'),
			('001','ผู้จัดการ', 'QA'),
			('002','พนักงาน', 'QA')
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