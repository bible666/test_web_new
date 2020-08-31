<?php
namespace App\Database\Migrations;

class Migration_sys_menu_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
		INSERT INTO sys_menu 
		(parent_menu_id, menu_type_flag, menu_name, menu_short_name, screen_url,menu_position) 
		VALUES 
		(-1,'M','ระบบขาย','ขาย','/',1),
		(-1,'M','ระบบคำนวน MRP','คำนวน MRP','/',2),
		(-1,'M','ระบบจัดซื้อ','จัดซื้อ','/',3),
		(-1,'M','ระบบการผลิต','การผลิต','/',4),
		(-1,'M','ระบบคลังสินค้า','คลังสินค้า','/',5),
		(-1,'M','ระบบการจัดส่ง','การจัดส่ง','/',6),
		(-1,'M','ระบบวัตถุดิบ','วัตถุดิบ','/',7),
		(-1,'M','การตั้งค่าระบบ','ระบบ','/',8),
		(1,'S','Forecast Entry','Add Forecast','/',1),
		(1,'S','Forecast Search','Forecast','/',2),
		(1,'S','เพิ่มคำสั่งซื้อ','เพิ่ม P/O','/',3),
		(1,'S','คำสั่งซื้อ','P/O','/',4),
		(2,'S','MRP สำหรับ จัดซื้อ','MRP จัดซื้อ','/',1),
		(2,'S','MRP สำหรับ การผลิต','MRP ผลิต','/',2),
		(3,'S','เปิดใบสั่งซื้อ','เปิด P/R','/',1),
		(3,'S','ใบสั่งซื้อ','P/R','/',2),
		(3,'S','รับวัตถุดิบ','รับวัตถุดิบ','/',3),
		(3,'S','เปิด P/R','เปิด P/R','/',4),
		(4,'S','เปิดใบสั่งผลิต','เปิดผลิต','/',1),
		(4,'S','ใบสั่งผลิต','สั่งผลิต','/',2),
		(4,'S','แผนการผลิต','แผนผลิต','/',3),
		(4,'S','บันทึกผลการผลิต','บันทึกผลิต','/',4),
		(4,'M','การตั้งค่าการผลิต','คำนวนผลิต','/',5),
		(24,'S','Process','Process','/',1),
		(24,'S','Line','Line','/',1),
		(24,'S','Line Calendar','Line Calendar','/',1),
		(24,'S','Item Capacity','Item Capacity','/',1),
		(5,'S','Location Transfer Entry','Location Transfer','/stock/transfer',1),
		(5,'S','Order Transfer','Order Transfer','/',2),
		(5,'S','Transfer Search','Transfer Search','/',3),
		(5,'S','Stock Search','Stock Search','/',4),
		(5,'S','Stock Taking','Stock Taking','/',5),
		(5,'S','Stock Taking Result Search','Stock Taking Result','/',6),
		(6,'S','Delivery Order Entry','D/O Entry','/',1),
		(6,'S','Delivery Search','D/O Search','/',2),
		(6,'S','Delivery Result Entry','D/O Result','/',3),
		(8,'S','บริษัท','บริษัท','/company/list',1),
		(8,'S','โรงงาน','โรงงาน','/factory/list',2),
		(8,'S','พื้นที่จัดเก็บ','พื้นที่จัดเก็บ','/location/list',3),
		(8,'S','สกุลเงิน','สกุลเงิน','/currency/list',4),
		(8,'S','หน่วยวัตถุดิบ','หน่วยวัตถุดิบ','/system/unit/list',5),
		(8,'S','ปฏิทิน','ปฏิทิน','/calendar/list',6),
		(8,'S','วัตถุดิบ','วัตถุดิบ','/system/item/list',1),
		(8,'S','โครงสร้างวัตถุดิบ','โครงสร้างวัตถุดิบ','/',2),
		(8,'S','ลูกค้า','ลูกค้า','/system/customer/list',3),
		(8,'S','ราคาขาย','ราคาขาย','/',4),
		(8,'S','ราคาซื้อ','ราคาซื้อ','/',5),
		(8,'S','ผู้ผลิต','ผู้ผลิต','/system/supplier/list',6),
		(8,'S','พนักงาน','พนักงาน','/',1)

        ");
    }

    public function down()
    {
        $this->db->query("

		DELETE FROM sys_menu
		");
    }
}
?>