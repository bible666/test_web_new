<?php
namespace App\Database\Migrations;

class Migration_mst_calendar extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_calendar(
                cal_no INT AUTO_INCREMENT PRIMARY KEY,
                cal_name varchar(50) NOT NULL,
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
        $this->dbforge->drop_table('mst_calendar');
    }
}
?>