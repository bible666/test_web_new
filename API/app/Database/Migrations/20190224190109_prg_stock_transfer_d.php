<?php
namespace App\Database\Migrations;

class Migration_prg_stock_transfer_d extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE prg_transfer_d(
            transfer_id        BIGINT UNSIGNED REFERENCES prg_stock_transfer_h(id),
            item_code          varchar(50) NOT NULL REFERENCES mst_item (item_code),
            lot_no             varchar(200) DEFAULT '',
            first_receive_date DATE,
            quantity           decimal(18,5),
            
            create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_date DATETIME ,
            create_user INT NOT NULL,
            update_user INT ,
            PRIMARY KEY( 
                transfer_id ASC,
                item_code ASC,
                lot_no ASC,
                first_receive_date ASC
            )
        );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('prg_transfer_d');
    }}
?>