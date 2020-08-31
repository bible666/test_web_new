<?php
namespace App\Database\Migrations;

class Migration_mst_calendar_detail extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        

            CREATE TABLE mst_calendar_detail (
                cal_no int NOT NULL,
                cal_date date NOT NULL,
                holiday_flag int,
                remark varchar(200),
                active_flag int,
                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT ,
                PRIMARY KEY( 
                    cal_no ASC,
                    cal_date ASC
                )
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_calendar_detail');
    }
}
?>