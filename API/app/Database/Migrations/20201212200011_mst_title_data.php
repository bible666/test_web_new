<?php
namespace App\Database\Migrations;

class Migration_mst_title_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        INSERT INTO mst_title
        (title_code, title_name_th, title_name_en, gender_code, create_date, create_user)
        values
        ('001','นาย','1','001',now(),1),
        ('002','นาง','2','002',now(),1),
        ('003','นางสาว','3','002',now(),1);
        ");

    }

    public function down()
    {
        $this->db->query("
        DELETE FROM mst_title;
        ");
    }}
?>