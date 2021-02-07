<?php
namespace App\Database\Migrations;

class Migration_mst_areas extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_areas(
                id              INT AUTO_INCREMENT PRIMARY KEY,
                center_id       INT NOT NULL COMMENT 'id ศูนย์' REFERENCES centers(id),
                area_name       text NOT NULL COMMENT 'ชื่อพื้นที่ดูแล',
                remark          text,
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลพื้นที่ดูแล';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_areas');
    }
}
?>