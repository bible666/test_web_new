<?php
namespace App\Database\Migrations;

class Migration_mst_supplier extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_supplier(
                supplier_code   varchar(50) PRIMARY KEY,
                supplier_name   varchar(200) NOT NULL,
                address         text         DEFAULT '',
                post_code       varchar(10)  DEFAULT '',
                tel_no          varchar(50)  DEFAULT '',
                fax_no          varchar(50)  DEFAULT '',
                e_mail          varchar(100) DEFAULT '',
                contact         varchar(100) DEFAULT '',
                delivery_time   int,
                tax_id          varchar(20)  DEFAULT '',
                payment_tearm   varchar(200) DEFAULT '',
                remark          varchar(200) DEFAULT '',
                active_flag     int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
                
            );

        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_supplier');
    }
}
?>