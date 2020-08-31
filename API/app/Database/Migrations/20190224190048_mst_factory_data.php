<?php
namespace App\Database\Migrations;

class Migration_mst_factory_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into mst_factory
        (company_code,factory_code,factory_name,active_flag,create_date,create_user)
        values
        ('T0001','T0001_F1','บริษัททดสอบ 1 โรงงานทดสอบ1',true,now(),1),
        ('T0001','T0001_F2','บริษัททดสอบ 1 โรงงานทดสอบ2',true,now(),1),
        ('T0001','T0001_F3','บริษัททดสอบ 1 โรงงานทดสอบ3',true,now(),1),
        ('T0002','T0002_F1','บริษัททดสอบ 2 โรงงานทดสอบ1',true,now(),1),
        ('T0002','T0002_F2','บริษัททดสอบ 2 โรงงานทดสอบ2',true,now(),1),
        ('T0002','T0002_F3','บริษัททดสอบ 2 โรงงานทดสอบ3',true,now(),1);
        ");
    }

    public function down()
    {
        $this->db->query("
            delete mst_factory;
        ");
    }
    
}
?>