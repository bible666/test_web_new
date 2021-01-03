<?php
namespace App\Database\Migrations;

class Migration_mst_user_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
            
            INSERT INTO mst_user 
            (title_code, first_name, last_name,  join_date, login_id, user_password, position_code, remark, active_flag, create_date, update_date, create_user, update_user, department_code) 
            VALUES 
            ('001', 'Manager', 'IT','2011-01-01','admin', 'admin','001', '', true,'2013-06-20 10:49:09','2013-06-20 10:49:09',1, 1, 'IT'),
            ('002', 'Staff', 'IT','2014-05-15','staffIT', 'password','001', '', true,'2014-05-15 15:00:25', '2014-12-19 11:22:12',1, 1, 'IT'),
			('003', 'Manager', 'Purchase','2014-05-15','managerPurchase', 'password','002', '', true,'2014-05-15 15:23:01', '2014-12-19 13:11:42',1, 1, 'PURCHASE'),
			('001', 'Staff', 'Purchase', '2014-05-15','staffPurchase', 'password','001', '', true,'2014-05-15 15:47:45' , '2014-12-19 13:11:42',1, 1, 'PURCHASE'),
            ('002', 'Manager', 'Production','2014-07-17','managerProduction', 'password','002', '', true,'2014-07-17 10:27:31', '2014-12-19 13:11:42' , 1, 1, 'PRODUCTION'),
            ('003', 'Staff', 'Production', '2014-08-18','staffProduction', 'password','001', '', true,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1, 'PRODUCTION'),
            ('001', 'Manager', 'Sales', '2014-08-18','managerSales', 'password','002', '', true,'2014-08-18 11:07:14', '2014-12-19 13:11:42', 1, 1, 'SALES'),
            ('002', 'Staff', 'Sales','2014-10-10','staffSales', 'password','001', '', true,'2014-10-10 18:51:47', '2014-12-19 13:11:42', 1, 1, 'SALES'),
            ('003', 'Manager', 'Transport', '2014-12-19', 'managerTransport', 'password','002', '', true,'2014-12-19 13:08:20', '2014-12-19 13:11:42', 1, 1, 'TRANSPORT'),
            ('001', 'Staff', 'Transport','2014-12-19',  'staffTransport', 'password','001', '', true,'2014-12-19 13:09:52', '2014-12-19 13:11:42', 1, 1, 'TRANSPORT'),
            ('002', 'Manager', 'WH','2014-12-19','managerWh', 'password','001', '', true,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1, 'WH'),
            ('003', 'Staff', 'Wh', '2014-12-19','staffWH', 'password','002', '', true,'2014-12-19 13:15:26', '2014-12-19 13:15:26', 1, 1, 'WH'),
            ('001', 'Manager', 'Store', '2015-01-07','managerStore', 'password','001', '', true,'2015-01-07 09:22:10','2015-01-07 09:22:10', 1, 1, 'STORE'),
            ('002', 'Staff', 'Store','2015-01-07','staffStore', 'password','002', '', true,'2015-01-07 09:24:08', '2015-01-07 09:24:08', 1, 1, 'STORE'),
            ('003', 'Manager', 'Planning', '2015-01-08','managerPlanning', 'password', '001', '', true,'2015-01-08 09:14:05', '2015-07-22 21:26:00', 1, 1, 'PLANNING'),
			('001', 'Staff', 'Planning', '2015-01-09','staffPlanning', 'password','002', '', true,'2015-01-09 15:21:58', '2015-01-09 15:21:58', 1, 1, 'PLANNING'),
			('002', 'Manager', 'Qa', '2015-01-08','managerQa', 'password', '001', '', true,'2015-01-08 09:14:05', '2015-07-22 21:26:00', 1, 1, 'QA'),
            ('003', 'Staff', 'Qa', '2015-01-09','staffQa', 'password','002', '', true,'2015-01-09 15:21:58', '2015-01-09 15:21:58', 1, 1, 'QA')

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