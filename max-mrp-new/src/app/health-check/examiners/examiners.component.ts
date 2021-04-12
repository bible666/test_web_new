import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../shared-common/confirm-dialog/confirm-dialog.component';
import { UserService } from '../../service/user.service';
import { TranslateService } from '@ngx-translate/core';

//Manual Service for this page
import { ExaminersService, cSearch, cData } from '../../service/examiners.service';

@Component({
  selector: 'app-examiners',
  templateUrl: './examiners.component.html',
  styleUrls: ['./examiners.component.css']
})
export class ExaminersComponent implements OnInit {

    public message: MessageClass[] = [];

    public CountData      : number = 20;
    public CurrentPage    : number = 1;
    public AllPage        : number = 13;
    public gridDatas      : cData[] = [];
    public frmSearchData  : cSearch;

    inputForm = new FormGroup( {
        'code'          : new FormControl(''),
        'name'          : new FormControl(''),
        'rowsPerpage'   : new FormControl('20')
    } );

    constructor(
        public dialog           : MatDialog,
        public translate        : TranslateService,
        private messageService  : MessageService,
        private userData        : UserService,
        private service         : ExaminersService,
    ) {
        translate.setDefaultLang('th');
        
        //set inital value when open form
        this.onInitValue();
    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;

        window.scroll(0,0);
        this.onSearch();
    }

    onInitValue() {
        this.inputForm.patchValue({
            'code'    : '',
            'name'    : ''
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
                    this.gridDatas    = data['data'];
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

    onDelete( id:number ) {

        const dialogRef = this.dialog.open( ConfirmDialogComponent , {
            width   : '350px',
            height  : '210px',
            data    : {
                description : this.translate.instant('COMMON.DO_YOU_WANT_TO_DELETE') ,
                id          : id
            }
        })
        
        dialogRef.afterClosed().subscribe(
            result => {
                if ( !result ) {
                    //cancel delete data
                    alert('hiii');
                } else {
                    this.service.deleteById( id ).subscribe(
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
        });
    }

}
