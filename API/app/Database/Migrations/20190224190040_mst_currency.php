<?php
namespace App\Database\Migrations;

class Migration_mst_currency extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_currency(
                currency_code varchar(10) PRIMARY KEY,
                currency_name varchar(50) DEFAULT '',
                default_currency int,
                remark varchar(200),
                active_flag int,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_currency');
    }
}
?>