<?php
namespace App\Database\Migrations;

class Migration_mst_gender_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        INSERT INTO mst_gender 
        (gender_code, gender_name_th, gender_name_en, create_date, create_user) 
        VALUES 
        ('001','ชาย','male',now(),1),
        ('002','หญิง','female',now(),1);
        ");

    }

    public function down()
    {
        $this->db->query("
        DELETE FROM mst_gender ;
        ");
    }
?>