<?php
namespace App\Database\Migrations;

class Migration_prg_user_position_history extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE prg_user_position_history(
            id                 INT AUTO_INCREMENT PRIMARY KEY,
            position_date      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            user_id            INT REFERENCES mst_user (user_id),
            position_name      varchar(200) NOT NULL DEFAULT '',
            salary             decimal(18,5) NOT NULL DEFAULT 0.00,
            ot_1               decimal(18,5) NOT NULL DEFAULT 0.00,
            ot_2               decimal(18,5) NOT NULL DEFAULT 0.00,
            ot_3               decimal(18,5) NOT NULL DEFAULT 0.00,
            
            create_date        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_date        DATETIME ,
            create_user        INT NOT NULL,
            update_user        INT
        );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('prg_user_position_history');
    }}
?>