<?php
namespace App\Database\Migrations;

class Migration_prg_stock_transfer_h extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE prg_transfer_h(
            id                 BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            doc_no             varchar(100) NOT NULL DEFAULT '',
            from_factory_code  varchar(10) NOT NULL REFERENCES mst_factory (factory_code),
            from_location_code varchar(10) NOT NULL REFERENCES mst_location (location_code),
            to_factory_code    varchar(10) NOT NULL REFERENCES mst_factory (factory_code),
            to_location_code   varchar(10) NOT NULL REFERENCES mst_location (location_code),
            remark             varchar(200) DEFAULT '',
            
            create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_date DATETIME ,
            create_user INT NOT NULL,
            update_user INT 
        );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('prg_transfer_h');
    }}
?>