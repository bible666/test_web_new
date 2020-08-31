<?php
namespace App\Database\Migrations;

class Migration_prg_token extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE prg_token(
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id INT REFERENCES mst_user(user_id),
                token_code varchar(200) NOT NULL,
                active_flag INT,

                create_date DATETIME NOT NULL,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            )
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('prg_token');
    }
}
?>