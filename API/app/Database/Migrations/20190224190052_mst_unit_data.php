<?php
namespace App\Database\Migrations;

class Migration_mst_unit_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            insert into mst_unit
            (unit_code,unit_name,active_flag,create_date,create_user)
            values
            ('cm','เซนติเมตร',true,now(),1),
            ('can','กระป๋อง',true,now(),1),
            ('kg','กิโลกรัม',true,now(),1),
            ('l','ลิตร',true,now(),1),
            ('m','เมตร',true,now(),1),
            ('mm','มิลลิเมตร',true,now(),1),
			('pcs','ชิ้น',true,now(),1),
			('box','กล่อง',true,now(),1),
			('book','เล่ม',true,now(),1),
			('m²','ตารางเมตร',true,now(),1),
			('car','คัน',true,now(),1);
            
        ");

    }

    public function down()
    {
        $this->db->query("
            delete mst_unit;
        ");
    }
}
?>