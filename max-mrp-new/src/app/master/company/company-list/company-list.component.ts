import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { CompanyService, cSearch, cData } from '../../../service/company.service';
import { UserService } from '../../../service/user.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from 'src/app/shared-common/confirm-dialog/confirm-dialog.component';

@Component({
    selector: 'app-company',
    templateUrl: './company-list.component.html',
    styleUrls: ['./company-list.component.css']
})
export class CompanyListComponent implements OnInit {

    public message        : MessageClass[] = [];

    public CountData      : number  = 20;
    public CurrentPage    : number  = 1;
    public AllPage        : number  = 13;
    public gridDatas      : cData[] = [];
    public frmSearchData  : cSearch;

    inputForm = new FormGroup ( {
        'company_code'  : new FormControl('') ,
        'company_name'  : new FormControl('') ,
        'description'   : new FormControl('') ,
        'rowsPerpage'   : new FormControl('20')
    } );

    constructor(
        private messageService  : MessageService ,
        private service         : CompanyService ,
        private userData        : UserService ,
        private dialog: MatDialog
    ) { 
        //set inital value when open form
        this.onInitValue();
    }

    ngOnInit() {
        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 37;
        window.scroll(0,0);
        this.onSearch();
    }

    onInitValue() {
        this.inputForm.patchValue( {
            'company_code'    : '',
            'company_name'    : ''
        } );
    }

    onSearch() {
        //set current page to 1
        this.CurrentPage  = 1;

        //set form value to class search
        this.frmSearchData = new cSearch(this.inputForm.value);

        this.frmSearchData.page_index   = this.CurrentPage;
        this.frmSearchData.rowsPerpage  = this.inputForm.value.rowsPerpage;
        this.getData();
        this.message = this.messageService.getMessage();
    }

    getData() {
        this.frmSearchData.page_index = this.CurrentPage;
        this.service.getListData(this.frmSearchData).subscribe (
            data => {
                if ( data['status'] == 'success' ) {
                    this.CountData    = data['max_rows'];
                    this.AllPage      = Math.ceil(this.CountData / this.inputForm.value.rowsPerpage);
                    this.gridDatas    = data['data'];
                }
            }
        );
    }

    onClear() {
        this.onInitValue();
        this.onSearch();
    }

    onSelectPage(PageNumber:number) {
        this.CurrentPage = PageNumber;
        this.getData();
    }

    onDelete(companyCode:string){
        const dialogRef = this.dialog.open(ConfirmDialogComponent, {
            width: '350px' ,
            height: '210px' ,
            data: {
                description : 'คุณต้องการลบรายการนี้หรือเปล่ารหัส '+companyCode ,
                id          : companyCode
            }
        } )
        
        dialogRef.afterClosed().subscribe(
            result => {
                if ( !result ) {
                    //cancel delete data
                    //alert('hiii');
                } else {
                    this.service.deleteById(companyCode).subscribe(
                        data => {
                            this.messageService.setSuccess('ทำการลบเสร็จแล้ว');
                            this.onSearch();
                        },
                        error => {
                            this.messageService.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                            this.message = this.messageService.getMessage();
                        }
                    );
                }
            }
        );
        
    }

}
