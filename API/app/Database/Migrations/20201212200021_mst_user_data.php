<?php
namespace App\Database\Migrations;

class Migration_mst_user_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
            INSERT INTO mst_user 
            (title, first_name, last_name,  join_date, login_id, user_password, user_group_id, remark, active_flag, create_date, update_date, create_user, update_user) 
            VALUES 
            (1, 'Manager', 'IT','2011-01-01','admin', 'admin',1, '', true,'2013-06-20 10:49:09','2013-06-20 10:49:09',1, 1),
            (3, 'Staff', 'IT','2014-05-15','staffIT', 'password',2, '', true,'2014-05-15 15:00:25', '2014-12-19 11:22:12',1, 1),
			(2, 'Manager', 'Purchase','2014-05-15','managerPurchase', 'password',3, '', true,'2014-05-15 15:23:01', '2014-12-19 13:11:42',1, 1),
			(1, 'Staff', 'Purchase', '2014-05-15','staffPurchase', 'password',4, '', true,'2014-05-15 15:47:45' , '2014-12-19 13:11:42',1, 1),
            (1, 'Manager', 'Production','2014-07-17','managerProduction', 'password',5, '', true,'2014-07-17 10:27:31', '2014-12-19 13:11:42' , 1, 1),
            (1, 'Staff', 'Production', '2014-08-18','staffProduction', 'password',6, '', true,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1),
            (1, 'Manager', 'Sales', '2014-08-18','managerSales', 'password',7, '', true,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1),
            (1, 'Staff', 'Sales','2014-10-10','staffSales', 'password',8, '', true,'2014-10-10 18:51:47', '2014-12-19 13:11:42', 1, 1),
            (3, 'Manager', 'Transport', '2014-12-19', 'managerTransport', 'password',9, '', true,'2014-12-19 13:08:20', '2014-12-19 13:11:42', 1, 1),
            (5, 'Staff', 'Transport','2014-12-19',  'staffTransport', 'password',10, '', true,'2014-12-19 13:09:52', '2014-12-19 13:11:42', 1, 1),
            (3, 'Manager', 'WH','2014-12-19','managerWh', 'password',11, '', true,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1),
            (3, 'Staff', 'Wh', '2014-12-19','staffWH', 'password',12, '', true,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1),
            (1, 'Manager', 'Store', '2015-01-07','managerStore', 'password', 13, '', true,'2015-01-07 09:22:10','2015-01-07 09:22:10', 1, 1),
            (1, 'Staff', 'Store','2015-01-07','staffStore', 'password',14, '', true,'2015-01-07 09:24:08', '2015-01-07 09:24:08', 1, 1),
            (1, 'Manager', 'Planning', '2015-01-08','managerPlanning', 'password', 15, '', true,'2015-01-08 09:14:05', '2015-07-22 21:26:00', 1, 1),
			(1, 'Staff', 'Planning', '2015-01-09','staffPlanning', 'password',16, '', true,'2015-01-09 15:21:58', '2015-01-09 15:21:58', 1, 1),
			(1, 'Manager', 'Qa', '2015-01-08','managerQa', 'password', 17, '', true,'2015-01-08 09:14:05', '2015-07-22 21:26:00', 1, 1),
            (1, 'Staff', 'Qa', '2015-01-09','staffQa', 'password',18, '', true,'2015-01-09 15:21:58', '2015-01-09 15:21:58', 1, 1)

        ");
    }

    public function down()
    {
        $this->db->query("

		DELETE FROM mst_user
		");
    }
}
?>