<?php
namespace App\Database\Migrations;

class Migration_mst_factory extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_factory(
                factory_code    varchar(10) ,
                company_code    varchar(10) REFERENCES mst_company (company_code),
                factory_name    varchar(100) DEFAULT '',
                address         text DEFAULT '',
                telno           varchar(50) DEFAULT '',
                faxno           varchar(50) DEFAULT '',
                email           varchar(100) DEFAULT '',
                cal_no          int,
                remark          varchar(200) DEFAULT '',
                active_flag  int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT ,
                PRIMARY KEY( 
                    factory_code ASC,
                    company_code ASC
                )
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_factory');
    }
}
?>