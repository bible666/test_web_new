import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { LocationService, cSearch, cData } from '../../../service/location.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../../common/confirm-dialog/confirm-dialog.component'

@Component( {
    selector    : 'app-location-list',
    templateUrl : './location-list.component.html',
    styleUrls   : ['./location-list.component.css']
} )
export class LocationListComponent implements OnInit {

    public message: MessageClass[] = [];

    public CountData      : number = 20;
    public CurrentPage    : number = 1;
    public AllPage        : number = 13;
    public gridDatas      : cData[] = [];
    public frmSearchData  : cSearch;

    inputForm = new FormGroup( {
        'factory_code'  : new FormControl(''),
        'location_code' : new FormControl(''),
        'location_name' : new FormControl(''),
        'description'   : new FormControl(''),
        'rowsPerpage'   : new FormControl('20')
    } );

    constructor(
        private service         : LocationService,
        public dialog           : MatDialog,
        private messageService  : MessageService
    ) {
        //set inital value when open form
        this.onInitValue();
    }

    ngOnInit() {
        window.scroll(0,0);
        this.onSearch();
    }

    onInitValue() {
        this.inputForm.patchValue({
            'location_code'    : '',
            'location_name'    : ''
        });
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
        this.service.getListData(this.frmSearchData).subscribe(
            data => {
                if (data['status'] == 'success'){
                    this.CountData    = data['max_rows'];
                    this.AllPage      = Math.ceil(this.CountData / this.inputForm.value.rowsPerpage);
                    this.gridDatas     = data['data'];
                }
            }
        );
    }

    onClear() {
        this.onInitValue();
        this.onSearch();
    }

    onSelectPage( PageNumber:number ) {
        this.CurrentPage = PageNumber;
        this.getData();
    }

    onDelete( facotry_code:string , location_code:string ) {

        const dialogRef = this.dialog.open( ConfirmDialogComponent , {
            width   : '350px',
            height  : '200px',
            data    : {
                description : 'คุณต้องการลบรายการนี้หรือเปล่า ' ,
                id          : location_code
            }
        })
        
        dialogRef.afterClosed().subscribe(
            result => {
                if ( !result ) {
                    //cancel delete data
                    //alert('hiii');
                } else {
                    this.service.deleteById( facotry_code , location_code ).subscribe(
                        data => {
                            this.messageService.setError('ทำการลบเสร็จแล้ว');
                            this.onSearch();
                        },
                        error => {
                            this.messageService.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                            this.message = this.messageService.getMessage();
                        }
                    );
                }
        });
    }

}


