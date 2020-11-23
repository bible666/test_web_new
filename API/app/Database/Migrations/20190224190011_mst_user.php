<?php
namespace App\Database\Migrations;

class Migration_mst_user extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            CREATE TABLE mst_user(
                user_id           INT AUTO_INCREMENT PRIMARY KEY,
                title             INT not null,
                first_name        varchar(200) DEFAULT '',
                last_name         varchar(200) DEFAULT '',
                gender            varchar(1) DEFAULT '' ,
                join_date         date ,
                birthday          date ,
                employee_id       VARCHAR(50) DEFAULT '',
                login_id	      VARCHAR(100) NOT NULL,
                user_password     VARCHAR(200) NOT NULL,
                user_group_id     int not null REFERENCES mst_user_group (user_group_id),
                id_card           varchar(20) DEFAULT '' ,
                tax_id            varchar(20) DEFAULT '' ,
                social_id         varchar(20) DEFAULT '' ,
                education_level   varchar(20) DEFAULT '' ,
                field_of_study    varchar(50) DEFAULT '' ,
                institution       varchar(100) DEFAULT '' ,
                gpa               varchar(10) DEFAULT '',
                address           varchar(1000) DEFAULT '',
                province          varchar(100) DEFAULT '',
                post_code         varchar(50) DEFAULT '',
                phone             varchar(50) DEFAULT '',
                mobile            varchar(50) DEFAULT '',
                e_mail            varchar(50) DEFAULT '',
                reference_name    varchar(200) DEFAULT '',
                reference_phone   varchar(50) DEFAULT '',
                bank_name         varchar(100) DEFAULT '',
                bank_account      varchar(50) DEFAULT '',
                remark            varchar(200) DEFAULT '',
                active_flag       int,
                last_login_time   DATETIME,
                last_ng_time      DATETIME,
                ng_count          INT      DEFAULT 0,
                account_loack     int DEFAULT false,

                create_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                update_date DATETIME ,
                create_user INT NOT NULL,
                update_user INT 
            );
        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_user');
    }
}
?>