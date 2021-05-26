import { Component, OnInit } from '@angular/core';
import { MessageService, MessageClass } from '../../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { CONSTANTS } from '../../../my-lib/constants';

//Manual Service for this page
import { PrgExaminersFraAService, GetDataById, cData } from '../../../service/prgExaminersFraA.service';


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
        private param           : ActivatedRoute,
        private messageService  : MessageService,
        private userData        : UserService,
        private service         : PrgExaminersFraAService
    ) {}

    ngOnInit(): void {
        this.userData.main_menu_selected = CONSTANTS.HEALTH_MENU.MAIN_MENU;
        this.userData.sub_menu_selected  = CONSTANTS.HEALTH_MENU.SUB_MENU.HEALTH_CHECK;

        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;
        this.id             = this.param.snapshot.params.id;

        this.getData();
    }

    getData() {
        this.service.getDataById(this.id).subscribe(
            data => {
                if (data['status'] == 'success'){
                    this.gridDatas     = data['data'];
                }
            }
        );
    }

}

