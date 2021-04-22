import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../shared-common/confirm-dialog/confirm-dialog.component';
import { UserService } from '../../service/user.service';
import { TranslateService } from '@ngx-translate/core';
import { LanguageService } from '../../service/language.service';
import { LazyLoadEvent, PrimeNGConfig } from 'primeng/api';

//Manual Service for this page
import { ExaminersService, cSearch, cData } from '../../service/examiners.service';

@Component({
  selector: 'app-examiners',
  templateUrl: './examiners.component.html',
  styleUrls: ['./examiners.component.css']
})
export class ExaminersComponent implements OnInit {

    public message: MessageClass[] = [];

    public gridDatas      : cData[];
    public frmSearchData  : cSearch;
    public loading        : boolean;

    public firstRecords   : number;
    public totalRecords   : number;
    public rowsPerPage    : number = 20;


    inputForm = new FormGroup( {
        'code'          : new FormControl(''),
        'name'          : new FormControl(''),
        'rowsPerpage'   : new FormControl('20')
    } );

    constructor(
        public dialog           : MatDialog,
        public translateService : TranslateService,
        public lang             : LanguageService,
        private messageService  : MessageService,
        private userData        : UserService,
        private service         : ExaminersService,
        private primengConfig: PrimeNGConfig
    ) {
        translateService.setDefaultLang(lang.defaultLang);
        
        //set inital value when open form
        this.onInitValue();
    }

    ngOnInit(): void {
        this.translate(this.lang.defaultLang);
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;

        window.scroll(0,0);
        this.onSearch();

        this.loading              = true;
        this.primengConfig.ripple = true;

        // this.primengConfig.setTranslation({
        //     "monthNames": ["มกราคม","กุมภาพันธ์","March","เมษายน","May","June","July","August","September","October","November","December"],
        // });
    }

    translate(lang: string) {
        this.translateService.use(lang);
        this.translateService.get('primeng').subscribe(res => this.primengConfig.setTranslation(res));
    }

    onInitValue() {
        this.inputForm.patchValue({
            'code'    : '',
            'name'    : ''
        });
    }

    onSearch() {
        //set form value to class search
        this.getData(null);

        this.message = this.messageService.getMessage();
    }

    getData(event: LazyLoadEvent) {
        this.loading              = true;

        //in a real application, make a remote request to load data using state metadata from event
        //event.first = First row offset
        //event.rows = Number of rows per page
        //event.sortField = Field name to sort with
        //event.sortOrder = Sort order as number, 1 for asc and -1 for dec
        //filters: FilterMetadata object having field as key and filter value, filter matchMode as value

        //imitate db connection over a network
        this.firstRecords = 0;
        if ( event ) {
            this.firstRecords = event.first;
            this.rowsPerPage  = event.rows;
        }
        this.frmSearchData = new cSearch(this.inputForm.value);

        this.frmSearchData.page_index   = this.firstRecords;
        this.frmSearchData.rowsPerpage  = this.rowsPerPage;
        this.service.getListData(this.frmSearchData).subscribe(
            data => {
                if (data['status'] == 'success'){
                    this.gridDatas      = data['data'];
                    this.totalRecords   = data['max_rows'];
                }
                this.loading              = false;
            }
        );
    }

    onClear() {
        this.onInitValue();
        this.onSearch();
    }


    onDelete( id:number ) {

        const dialogRef = this.dialog.open( ConfirmDialogComponent , {
            width   : '350px',
            height  : '210px',
            data    : {
                description : this.translateService.instant('COMMON.DO_YOU_WANT_TO_DELETE') ,
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
