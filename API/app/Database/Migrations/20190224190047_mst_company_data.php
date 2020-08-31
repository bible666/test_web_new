<?php
namespace App\Database\Migrations;

class Migration_mst_company_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into mst_company
        (company_code,company_name,active_flag,create_date,create_user)
        values
        ('T0001','บริษัททดสอบ 1',true,now(),1),
        ('T0002','บริษัททดสอบ 2',true,now(),1);
        ");
    }

    public function down()
    {
        $this->db->query("
            delete mst_company;
        ");
    }
}
?>