<?php
namespace App\Database\Migrations;

class Migration_mst_department_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

            INSERT mst_department 
            (department_code,department_name, active_flag, create_user) 
            VALUES 
            ('IT','แผนก IT',true, 1),
			('PURCHASE','แผนก จัดซื้อ',true,1),
			('PRODUCTION','แผนก ผลิต',true, 1),
			('SALES','แผนก ขายและการตลาด',true, 1),
			('TRANSPORT','แผนก ขนส่ง',true, 1),
			('WH','แผนก คลังสินค้า',true, 1),
			('STORE','แผนก วัตถุดิบ',true, 1),
			('PLANNING','แผนก วางแผน',true, 1),
			('QA','แผนก ตรวจสอบ',true, 1)
        ");
    }

    public function down()
    {
		$this->db->query("

		DELETE FROM mst_department
		");
    }
}
?>