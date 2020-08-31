<?php
namespace App\Database\Migrations;

class Migration_mst_currency_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            INSERT INTO mst_currency 
(currency_code, currency_name, active_flag, remark, create_user, create_date, update_user, update_date, default_currency) VALUES 
('JPY', 'Japanese Ye', 1, '', 1, '2015-01-27 10:29:03', 1, '2015-01-27 10:29:03' , 0 ),
('THB', 'Thai Baht',   1, '', 1, '2015-01-27 10:29:03', 1, '2015-03-10 10:58:38' , 1),
('USD', 'US Dollas',   1, '', 1, '2015-01-27 10:29:03', 1, '2015-01-27 10:29:03' , 0)

        ");
    }

    public function down()
    {
        $this->dbforge->drop_table('mst_currency');
    }
}
?>