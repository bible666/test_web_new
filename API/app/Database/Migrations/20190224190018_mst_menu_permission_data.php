<?php
namespace App\Database\Migrations;

class Migration_mst_menu_permission_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("

		INSERT INTO mst_menu_permission 
		(menu_id, user_group_id, permission_flag, create_user) 
		VALUES 
		(1,1,'A',1), #'ระบบขาย'
		(2,1,'A',1), #'ระบบคำนวน MRP'
		(3,1,'A',1), #'ระบบจัดซื้อ'
		(4,1,'A',1), #'ระบบการผลิต'
		(5,1,'A',1), #'ระบบคลังสินค้า'
		(6,1,'A',1), #'ระบบการจัดส่ง'
		(7,1,'A',1), #'ระบบวัตถุดิบ'
		(8,1,'A',1), #'การตั้งค่าระบบ'
		(9,1,'A',1), #'Forecast Entry'
		(10,1,'A',1), #'Forecast Search'
		(11,1,'A',1), #'เพิ่มคำสั่งซื้อ'
		(12,1,'A',1), #'คำสั่งซื้อ'
		(13,1,'A',1), #'MRP สำหรับ จัดซื้อ'
		(14,1,'A',1), #'MRP สำหรับ การผลิต'
		(15,1,'A',1), #'เปิดใบสั่งซื้อ'
		(16,1,'A',1), #'ใบสั่งซื้อ'
		(17,1,'A',1), #'รับวัตถุดิบ'
		(18,1,'A',1), #'เปิด P/R'
		(19,1,'A',1), #'เปิดใบสั่งผลิต'
		(20,1,'A',1), #'ใบสั่งผลิต'
		(21,1,'A',1), #'แผนการผลิต'
		(22,1,'A',1), #'บันทึกผลการผลิต'
		(23,1,'A',1), #'การตั้งค่าการผลิต'
		(24,1,'A',1), #'Process'
		(25,1,'A',1), #'Line'
		(26,1,'A',1), #'Line Calendar'
		(27,1,'A',1), #'Item Capacity'
		(28,1,'A',1), #'Location Transfer Entry'
		(29,1,'A',1), #'Order Transfer'
		(30,1,'A',1), #'Transfer Search'
		(31,1,'A',1), #'Stock Search'
		(32,1,'A',1), #'Stock Taking'
		(33,1,'A',1), #'Stock Taking Result Search'
		(34,1,'A',1), #'Delivery Order Entry'
		(35,1,'A',1), # 'Delivery Search'
		(36,1,'A',1), #'Delivery Result Entry'
		(37,1,'A',1), #'Basic Master'
		(38,1,'A',1), #'Transaction Master'
		(39,1,'A',1), #'Admin Master'
		(40,1,'A',1), #'บริษัท'
		(41,1,'A',1), #'โรงงาน'
		(42,1,'A',1), #'พื้นที่จัดเก็บ'
		(43,1,'A',1), #'สกุลเงิน'
		(44,1,'A',1), #'หน่วยวัตถุดิบ'
		(45,1,'A',1), #'ปฏิทิน'
		(46,1,'A',1), #'วัตถุดิบ'
		(47,1,'A',1), #'โครงสร้างวัตถุดิบ'
		(48,1,'A',1), #'ลูกค้า'
		(49,1,'A',1), #'ราคาขาย'
		(50,1,'A',1), #'ราคาซื้อ'
		(51,1,'A',1) #'พนักงาน'

        ");
    }

    public function down()
    {
        $this->db->query("

		DELETE FROM mst_menu_permission
		");
    }
}
?>