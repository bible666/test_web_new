import { Component, OnInit } from '@angular/core';
import { MessageService, MessageClass } from '../../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { UserService } from '../../../service/user.service';

//Manual Service for this page
import { ExaminersService, cSearch, cData } from '../../../service/examiners.service';


@Component({
    selector: 'app-flail-report',
    templateUrl: './flail-report.component.html',
    styleUrls: ['./flail-report.component.css']
})
export class FlailReportComponent implements OnInit {

    public message: MessageClass[] = [];
    public gridDatas      : cData[] = [];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public id           : number;
    public examiner_id  : number;

    constructor(
        public dialog           : MatDialog,
        private messageService  : MessageService,
        private userData        : UserService,
        private service         : ExaminersService,
    ) {}

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;

        window.scroll(0,0);
        this.getData();
    }

    getData() {
        //this.frmSearchData.page_index = this.CurrentPage;
        // this.service.getListData(this.frmSearchData).subscribe(
        //     data => {
        //         if (data['status'] == 'success'){
        //             this.gridDatas     = data['data'];
        //         }
        //     }
        // );
    }

}

