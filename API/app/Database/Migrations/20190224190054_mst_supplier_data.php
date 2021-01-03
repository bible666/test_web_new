<?php
namespace App\Database\Migrations;

class Migration_mst_supplier_data extends \CodeIgniter\Database\Migration {

    public function up()
    {
        $this->db->query("
        insert into mst_supplier
        (supplier_code,supplier_name,branch_name,address,post_code,tel_no,fax_no,e_mail,contact,delivery_time,tax_id,payment_tearm,remark)
        values
        ('A0001','แพลนเนท บาร์โค้ด','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8), '42/1 ซอยพระรามเก้า 43 ถนนเสรี 4', 'แขวงสวนหลวง เชตสวนหลวง','กรุงเทพ'),'10250','02-5648585','023654825','','',0,'01234567890','',''),
        ('A0002','M-SOFT (THAILAND)','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8), '43 Thai CC Tower 17 Fl.Room No.173-174 South Sathorn Rd,', 'Yannawa,Sathorn','Bangkok'),'10120','02-6739980','','','',0,'0105541029138','',''),
        ('A0003','SATO AUTO-ID(THAILAND) Co.,Ltd','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8), '292/1 Moo 1 Thepararak Rd.,Tumbol Theparak,', 'Amphur Muang,','Samutprakarn'),'10270','02-7364460','','','',0,'1015544065178','',''),
        ('A0004','เอสวายไทย','สาขา 1',CONCAT_WS(CHAR(10 using utf8),'138 อาคารบุญมิตร ชั้นหนึ่ง ถ.สีลม แขวงสุรียวงศ์','เขตบางรัก','กรงเทพฯ'),'10500','02-65214565','02-32564585','','',0,'12345668555','',''),
        ('A0005','Toyo Recruitment Co.,Ltd','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'32/23 2th Fl.,Sino Thai Tower.','Sukhumwit21 Rd,(Asoke) Klong toey-Nua','Wattana   Bangkok'),'10110','02-2595113','','','',0,'0105552132504','',''),
        ('A0006','คอมม์บางกอก','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'410/120-121 อาคารดิเอ็กเช็คคิวทีฟ เฮ้าส์ ชั้น 11','ถ.สุรวงศ์ แขวงสี่พระยา เขตบางรัก','กรุงเทพฯ'),'10500','02-237-4689','02-237-7079','','',0,'0105536006966','',''),
        ('A0007','คอมเซเว่น','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'2545 ถนนเพชรบุรี ','แขวงสวนหลวง เขตสวนหลวง','กรุงเทพฯ'),'10250','083-9890835','','','',0,'0107557000462','',''),
        ('A0008','เจท คอมพิวเตอร์ พลัส','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'7 อาคารศูนย์การค้า เดอะไอที มอลล์ชั้น 3 ห้อง 3 พี 37','ถนนรัชดาภิเษก แขวงดินแดง เขตดินแดง','กรุงเทพฯ'),'10400','02-6420748','','','',0,'0105543051955','',''),
        ('A0009','จัดหางานจ๊อบส์ ดีบี (ประเทศไทย)','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'1 เอ็มไพร์ทาวเวอร์ 3 ชั้น 26 ยูนิต 2607-2608','ถนนสาทรใต้ แขวงยานนาวา เขตสาทร','กรุงเทพฯ'),'10120','','','','',0,'0105542073068','',''),
        ('A0010','ซิงค์ ดีไซน์','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'138 อาคารบุญมิตร ชั้น 6 ห้อง ซี 2,ถนนสีลม เเขวงสุรียงศ์ เขตบางรัก','กรุงเทพฯ',''),'','02-2336657','02-2336659','','',0,'0105547068411','',''),
        ('A0011','ซีเอส ล็อกซอินโฟ','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'90 อาคารไซเบอร์เวิร์ลด ทาวเวอร์ เอ ชั้น 17-20','ถ.รัชดาภิเษก แขวงห้วยขวาง เขตห้วยขวาง','กรุงเทพ'),'10310','02-2638108','','','',0,'0107546000377','',''),
        ('A0012','ทีโอที','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'89/2 หมู่ 3 ถนนแจ้งวัฒนะ','แขวงทุ่งสองห้อง เขตหลักสี่','กรุงเทพ'),'10210','','','','',0,'0107545000161','','มีค่าบริการด้วย'),
        ('A0013','ทิงค์เนต','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'323 อาคารยูไนเต็ดเซ็นเตอร์ ชั้น 14 ห้อง 1402 เอ','ถนนสีลม แขวงสีลม เขตบางรัก','กรุงเทพ'),'10500','','','','',0,'0125543004205','',''),
        ('A0014','บุญเรือน สุดหอม','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'403 หมู่ 11','ต.ท่ามะไฟหวาน อ.แกร้งคร้อ','จ.ช้ยภูมิ'),'34150','','','','',0,'3361200278927','',''),
        ('A0015','พี เอ็ม เอส พริ้นติ้ง','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'39/1 ซอยสุขุมวิท 23 ถนนสุขุมวิท','แขวงคลองเตยเหนือ เขตวัฒนา','กรุงเทพฯ'),'10110','','','','',0,'10110','',''),
        ('A0016','ฟีน่า พร็อพเพอร์ตี้ จำกัด','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'อาคาร โรงแรม ฮอลิเดย์ อินน์ กรุงเทพฯ สุขุมวิท 22','เลขที่ 1 ซอยสุุขุมวิท 22 ถนน สุขุมวิทย แขวงคลองตัน','เขตคลองเตย กรุงเทพฯ'),'10110','02-6834888','026834777','','',0,'0105551010138','',''),
        ('A0017','เมมโมรี่ทูเดย์','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'7 อาคารศูนย์การค้าเดอะไอทีมอลล์ ชั้น 3 ห้อง 3 อาร์ 22','ถนนรัชดาภิเษก แขวงดินแดง เขตดินแดง','กรุงเทพฯ'),'10400','084-9599000','','','',0,'010554106210','',''),
        ('A0018','แอดวานซ์ไวร์เลส เน็ตเวอร์ค','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'408/60 อาคารพหลโยธินเพลส ชั้น15 ถ.พหลโยธิน','แขวงสามเสน เขตพญาไท','กทม.'),'10400','','','','',0,'0105548115897','',''),
        ('A0019','ไอที ซิตี้ (มหาชน)','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'604/3 อาคารพันธุ์ทิพย์พลาซ่า ชั้น 5-6 ถนนเพชรบุรี','แขวงถนนเพชรบุรี เขตราชเทวี','กรุงเทพฯ'),'10400','02-6565030','','','',0,'0107545000349','',''),
        ('A0020','แอดไวซ์ โฮลดิ้งส์','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'74ม74/1-2 หมู่ 1 ถ.ราชพฤกษ์','ต.ท่าอิฐ อ.ปากเกร็ด','นนทบุรี'),'11120','02-5470000','02-5470088','','',0,'0105552068237','',''),
        ('A0021','เอช ที อาร์ จำกัด','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'32/46 ชั้น 18 อาคารชิโน-ไทย ทาวเวอร์ ถ.สุขุมวิท21','แขวงคลองเตยเหนือ เขตวัฒนา','กทม.'),'10110','02-259-8911-6','','','',0,'0105525016175','',''),
        ('A0022','A CROSS TRAVEL AND LEISURE','สำนักงานใหญ่',CONCAT_WS(CHAR(10 using utf8),'115 Rompo Mansion Bldg,RM.105','Rimtangrodfaisaipaknam Road Klongtoey Klongtoey','Bangkok'),'10110','02-6713023-4','02-671-3012','','รุ่งทิวา',0,'0105553141612','','');
        ");

    }

    public function down()
    {
        $this->db->query("
            delete mst_supplier;
        ");
    }
}
?>