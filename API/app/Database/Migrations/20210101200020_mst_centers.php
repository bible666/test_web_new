<?php
namespace App\Database\Migrations;

class Migration_mst_centers extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_centers(
                id              INT AUTO_INCREMENT PRIMARY KEY,
                center_cat      INT NOT NULL COMMENT 'ประเภทของศูนย์',
                center_name     text NOT NULL COMMENT 'ชื่อศูนย​์',
                post_cd         text NOT NULL DEFAULT '' COMMENT 'รหัสไปรษณีย์',
                prefectures     INT NOT NULL COMMENT 'จังหวัด',
                address         text NOT NULL DEFAULT '' COMMENT 'ที่อยู่',
                phone           text NOT NULL DEFAULT '' COMMENT 'เบอร์โทร',
                manager_name    text NOT NULL DEFAULT '' COMMENT 'ชื่อผู้จัดการ',
                manager_email   text NOT NULL DEFAULT '' COMMENT 'e-mail ผู้จัดการ',
                create_date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date     DATETIME ,
                create_user     INT NOT NULL,
                update_user     INT 
            )
            COMMENT 'ข้อมูลศูนย์';
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_centers');
    }
}
?>