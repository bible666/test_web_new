<?php
namespace App\Database\Migrations;

class Migration_mst_gender extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        CREATE TABLE mst_gender(
            gender_code        varchar(3) PRIMARY KEY,
            gender_name_th     varchar(200),
            gender_name_en     varchar(200),
            create_date        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            update_date        DATETIME ,
            create_user        INT NOT NULL,
            update_user        INT
        );
        ");

    }

    public function down()
    {
        $this->dbforge->drop_table('mst_gender');
    }}
?>