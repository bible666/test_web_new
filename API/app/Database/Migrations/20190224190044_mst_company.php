<?php
namespace App\Database\Migrations;

class Migration_mst_company extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_company(
                company_code varchar(10) PRIMARY KEY,
                company_name varchar(100) DEFAULT '',
                address       text DEFAULT '',
                zip          varchar(20) DEFAULT '',
                telno        varchar(50) DEFAULT '',
                faxno        varchar(50) DEFAULT '',
                email        varchar(100) DEFAULT '',
                cal_no       int,
                remark varchar(200) DEFAULT '',
                active_flag int NOT NULL,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_company');
    }
}
?>