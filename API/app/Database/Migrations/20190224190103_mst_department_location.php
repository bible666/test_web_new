<?php
namespace App\Database\Migrations;

class Migration_mst_department_location extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_department_location(
				factory_code       varchar(10) NOT NULL REFERENCES mst_factory (factory_code),
				location_code      varchar(10) NOT NULL REFERENCES mst_location (location_code),
				department_code    varchar(50) NOT NULL REFERENCES mst_department (department_code),

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
				update_user INT ,
				PRIMARY KEY( 
                    factory_code ASC,
					location_code ASC,
					department_code ASC
                )
                
            );

        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_department_location');
    }
}
?>