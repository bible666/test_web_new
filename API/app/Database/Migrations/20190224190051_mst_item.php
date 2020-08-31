<?php
namespace App\Database\Migrations;

class Migration_mst_item extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_item(
                item_code               varchar(50) PRIMARY KEY,
                item_name               varchar(200) NOT NULL,
                item_type               varchar(1) NOT NULL DEFAULT '',
                lot_flag                int,
                unit_code               varchar(10) REFERENCES mst_unit( unit_code),
                standard_location       varchar(10) DEFAULT '',
                production_lead_time    int,
                request_decimal         int,
                mrp_flag                int,
                remark                  varchar(200) DEFAULT '',
                active_flag             int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
                
            );

        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_item');
    }
}
?>