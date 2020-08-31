<?php
namespace App\Database\Migrations;

class Migration_mst_location_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into mst_location
        (factory_code,location_code,location_name,mrp_flag,expire_flag,active_flag,create_date,create_user)
        values
        ('T0001_F1','store F1','คลังวัตถุดิบ ',true,true,true,now(),1),
        ('T0001_F1','WIP1 F1','คลังวัตถุดิบ ผลิต 1',true,true,true,now(),1),
        ('T0001_F1','WIP2 F1','คลังวัตถุดิบ ผลิต 2',true,true,true,now(),1),
        ('T0001_F1','WH F1','คลังสินค้า',false,true,true,now(),1),
		('T0001_F1','RD F1','R & D',false,true,true,now(),1),
		('T0001_F1','IT','แผนก IT',false,true,true,now(),1),
		('T0001_F1','PURCHASE','แผนก จัดซื้อ',false,true,true,now(),1),
		('T0001_F1','PRODUCTION','แผนก ผลิต',false,true,true,now(),1),
		('T0001_F1','SALES','แผนก ขาย',false,true,true,now(),1),
		('T0001_F1','TRANSPORT','แผนก ขนส่ง',false,true,true,now(),1),
		('T0001_F1','WH','แผนก คลังสินค้า',false,true,true,now(),1),
		('T0001_F1','STORE','แผนก วัตถุดิบ',false,true,true,now(),1),
		('T0001_F1','PLANNING','แผนก วางแผน',false,true,true,now(),1),
		('T0001_F1','QA','แผนก ตรวจสอบ',false,true,true,now(),1);
        ");

    }

    public function down()
    {
        $this->db->query("
            delete mst_location;
        ");
    }
}
?>