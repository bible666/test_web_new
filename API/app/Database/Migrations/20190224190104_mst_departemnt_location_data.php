<?php
namespace App\Database\Migrations;

class Migration_mst_department_location_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into mst_department_location
        (factory_code,location_code,department_code,create_user)
        values
        ('T0001_F1','store F1','IT',1),
        ('T0001_F1','WIP1 F1','IT',1),
        ('T0001_F1','WIP2 F1','IT',1),
        ('T0001_F1','WH F1','IT',1),
		('T0001_F1','RD F1','IT',1),
		('T0001_F1','IT','IT',1),
		('T0001_F1','PURCHASE','IT',1),
		('T0001_F1','PRODUCTION','IT',1),
		('T0001_F1','SALES','IT',1),
		('T0001_F1','TRANSPORT','IT',1),
		('T0001_F1','WH','IT',1),
		('T0001_F1','STORE','IT',1),
		('T0001_F1','PLANNING','IT',1),
        ('T0001_F1','QA','IT',1),
        ('T0001_F1','PURCHASE','PURCHASE',1),
        ('T0001_F1','store F1','PURCHASE',1),
        ('T0001_F1','store F1','PRODUCTION',1),
        ('T0001_F1','WIP1 F1','PRODUCTION',1),
        ('T0001_F1','WIP2 F1','PRODUCTION',1),
        ('T0001_F1','PRODUCTION','PRODUCTION',1),
        ('T0001_F1','WH F1','SALES',1),
        ('T0001_F1','SALES','SALES',1),
        ('T0001_F1','WH F1','TRANSPORT',1),
        ('T0001_F1','TRANSPORT','TRANSPORT',1),
        ('T0001_F1','WH F1','WH',1),
        ('T0001_F1','TRANSPORT','WH',1),
        ('T0001_F1','store F1','STORE',1),
        ('T0001_F1','STORE','STORE',1),
        ('T0001_F1','store F1','PLANNING',1),
        ('T0001_F1','WIP1 F1','PLANNING',1),
        ('T0001_F1','WIP2 F1','PLANNING',1),
        ('T0001_F1','WH F1','PLANNING',1),
        ('T0001_F1','PLANNING','PLANNING',1),
        ('T0001_F1','QA','QA',1);
        ");

    }

    public function down()
    {
        $this->db->query("
            delete mst_department_location;
        ");
    }
}
?>