import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../../shared-common/confirm-dialog/confirm-dialog.component';
import { UserService } from '../../../service/user.service';
import { ActivatedRoute } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { LanguageService } from '../../../service/language.service';

//Manual Service for this page
import { PrgExaminersFraAService, cData, cSearch } from '../../../service/prgExaminersFraA.service';


@Component({
    selector: 'app-flail-index',
    templateUrl: './flail-index.component.html',
    styleUrls: ['./flail-index.component.css']
})
export class FlailIndexComponent implements OnInit {

    public message: MessageClass[] = [];

    public CountData      : number = 20;
    public CurrentPage    : number = 1;
    public AllPage        : number = 13;
    public gridDatas      : cData[] = [];
    public frmSearchData  : cSearch;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public examiner_id        : number;

    inputForm = new FormGroup( {
        'examiner_id'   : new FormControl(0),
        'rowsPerpage'   : new FormControl('20')
    } );

    constructor(
        public dialog           : MatDialog,
        public translate        : TranslateService,
        public lang             : LanguageService,
        private param           : ActivatedRoute,
        private messageService  : MessageService,
        private userData        : UserService,
        private service         : PrgExaminersFraAService,
    ) {
        translate.setDefaultLang(lang.defaultLang);
        //set inital value when open form
        this.examiner_id    = this.param.snapshot.params.examiner_id;
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
            'examiner_id'    : this.examiner_id
        });
    }

    onSearch() {
        //set current page to 1
        this.CurrentPage  = 1;

        //set form value to class search
        this.frmSearchData = new cSearch(this.inputForm.value);

        this.frmSearchData.page_index   = this.CurrentPage;
        this.frmSearchData.rowsPerpage  = this.inputForm.value.rowsPerpage;
        this.examiner_id                = this.examiner_id;
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

    onDelete( unit_code:string ) {

        const dialogRef = this.dialog.open( ConfirmDialogComponent , {
            width   : '350px',
            height  : '210px',
            data    : {
                description : 'คุณต้องการลบรายการนี้หรือเปล่า ' ,
                id          : unit_code
            }
        })
        
        dialogRef.afterClosed().subscribe(
            result => {
                if ( !result ) {
                    //cancel delete data
                    //alert('hiii');
                } else {
                    // this.service.deleteById( unit_code ).subscribe(
                    //     data => {
                    //         this.messageService.setSuccess('ทำการลบเสร็จแล้ว');
                    //         this.onSearch();
                    //     },
                    //     error => {
                    //         this.messageService.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                    //         this.message = this.messageService.getMessage();
                    //     }
                    // );
                }
        });
    }

}
