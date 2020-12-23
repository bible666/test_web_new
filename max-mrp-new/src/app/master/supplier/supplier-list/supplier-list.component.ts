import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { LoadingService } from '../../../service/loading.service';
import { UserService } from '../../../service/user.service';
import { ConfirmDialogComponent } from '../../../shared-common/confirm-dialog/confirm-dialog.component';
import { tap, finalize } from 'rxjs/operators';

//Please Update this service
import { SupplierService, cSearch, cData } from '../../../service/supplier.service';

@Component({
    selector: 'app-supplier-list',
    templateUrl: './supplier-list.component.html',
    styleUrls: ['./supplier-list.component.css']
})
export class SupplierListComponent implements OnInit {

    public message: MessageClass[] = [];

    public CountData      : number = 20;
    public CurrentPage    : number = 1;
    public AllPage        : number = 13;
    public gridDatas      : cData[] = [];
    public frmSearchData  : cSearch;

    inputForm = new FormGroup({
        'supplier_code' : new FormControl(''),
        'supplier_name' : new FormControl(''),
        'rowsPerpage'   : new FormControl('20')
    });

    constructor(
        private service: SupplierService,
        public  dialog: MatDialog,
        private messageService: MessageService,
        private userData        : UserService ,
        private loading: LoadingService
    ) {
        //set inital value when open form
        this.onInitValue();
    }

    ngOnInit() {
        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 48;
        window.scroll(0,0);
        this.onSearch();
    }

    onInitValue(){
        this.inputForm.patchValue({
            'supplier_code'    : '',
            'supplier_name'    : ''
        });
    }

    onSearch(){
        //set current page to 1
        this.CurrentPage  = 1;

        //set form value to class search
        this.frmSearchData = new cSearch(this.inputForm.value);

        this.frmSearchData.page_index   = this.CurrentPage;
        this.frmSearchData.rowsPerpage  = this.inputForm.value.rowsPerpage;
        this.getData();
        this.message = this.messageService.getMessage();

    }

    getData(){
        this.frmSearchData.page_index = this.CurrentPage;
        this.service.getListData(this.frmSearchData)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(data => {
            if (data['status'] == 'success'){
                this.CountData    = data['max_rows'];
                this.AllPage      = Math.ceil(this.CountData / this.inputForm.value.rowsPerpage);
                this.gridDatas     = data['data'];
            }
        
        });
    }

    onClear(){
        this.onInitValue();
        this.onSearch();
    }

    onSelectPage(PageNumber:number){
        this.CurrentPage = PageNumber;
        this.getData();
    }

    onDelete(supplier_code:string){

        const dialogRef = this.dialog.open(ConfirmDialogComponent,{
            width: '350px',
            height: '200px',
            data: {description: 'คุณต้องการลบรายการนี้หรือเปล่า ',id:supplier_code}
        })
        
        dialogRef.afterClosed().subscribe(result=>{
            if (!result){
                //cancel delete data
                //alert('hiii');
            } else {
                this.service.deleteById(supplier_code)
                .pipe(
                    tap(()=>{this.loading.show();}),
                    finalize(()=>{this.loading.hide();})
                )
                .subscribe(data=>{
                    this.messageService.setSuccess('ทำการลบเสร็จแล้ว');
                    this.onSearch();
                },
                error=>{
                    this.messageService.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                    this.message = this.messageService.getMessage();
                });

            }
        });
    }

}
