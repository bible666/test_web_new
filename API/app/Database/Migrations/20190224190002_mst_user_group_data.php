<?php
namespace App\Database\Migrations;

class Migration_mst_user_group_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_user_group 
            (user_group_name, active_flag,  create_user,department_code) 
            VALUES 
            ('ผู้จัดการแผนก IT',true, 1,'IT'),
			('พนักงานแผนก IT',true, 1,'IT'),
			('ผู้จัดการแผนก จัดซื้อ',true, 1,'PURCHASE'),
			('พนักงานแผนก จัดซื้อ',true, 1,'PURCHASE'),
			('ผู้จัดการแผนก ผลิต',true, 1,'PLANNING'),
			('พนักงานแผนก ผลิต',true, 1,'PLANNING'),
			('ผู้จัดการแผนก ขายและการตลาด',true, 1,'SALES'),
			('พนักงานแผนก ขายและการตลาด',true, 1,'SALES'),
			('ผู้จัดการแผนก ขนส่ง',true, 1,'TRANSPORT'),
			('พนักงานแผนก ขนส่ง',true, 1,'TRANSPORT'),
			('ผู้จัดการแผนก คลังสินค้า',true, 1,'WH'),
			('พนักงานแผนก คลังสินค้า',true, 1,'WH'),
			('ผู้จัดการแผนก วัตถุดิบ',true, 1,'STORE'),
			('พนักงานแผนก วัตถุดิบ',true, 1,'STORE'),
			('ผู้จัดการแผนก วางแผน',true, 1,'PLANNING'),
			('พนักงานแผนก วางแผน',true, 1,'PLANNING'),
			('ผู้จัดการแผนก ตรวจสอบ',true, 1,'QA'),
			('พนักงานแผนก ตรวจสอบ',true, 1,'QA')
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