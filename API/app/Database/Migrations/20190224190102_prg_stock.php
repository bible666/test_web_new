<?php
namespace App\Database\Migrations;

class Migration_prg_stock extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_stock(
				factory_code       varchar(10) NOT NULL REFERENCES mst_factory (factory_code),
				location_code      varchar(10) NOT NULL REFERENCES mst_location (location_code),
				item_code          varchar(50) NOT NULL REFERENCES mst_item (item_code),
				lot_no             varchar(200) DEFAULT 'ไม่ระบุ',
				first_receive_date DATE,
				quantity           decimal(18,5),
				unit_price         decimal(18,5),
				remark             varchar(200) DEFAULT '',

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
				update_user INT ,
				PRIMARY KEY( 
                    factory_code ASC,
					location_code ASC,
					item_code ASC,
                    lot_no ASC,
                    first_receive_date ASC
                )
                
            );

        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('prg_stock');
    }
}
?>