<?php
namespace App\Database\Migrations;

class Migration_prg_salary extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE prg_salary(
            year               varchar(4) NOT NULL DEFAULT '',
            month              varchar(2) NOT NULL DEFAULT '',
            user_id            INT REFERENCES mst_user (user_id),
            salary             decimal(18,5) NOT NULL DEFAULT 0.00,
            commissions        decimal(18,5) NOT NULL DEFAULT 0.00,
            over_time          decimal(18,5) NOT NULL DEFAULT 0.00,
            tax                decimal(18,5) NOT NULL DEFAULT 0.00,
            social_tax         decimal(18,5) NOT NULL DEFAULT 0.00,
            create_date        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_date        DATETIME ,
            create_user        INT NOT NULL,
            update_user        INT ,
            PRIMARY KEY( 
                year ASC,
                month ASC,
                user_id ASC
            )
        );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('prg_salary');
    }}
?>