import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { ComboData } from '../../service/combo.service';
import { UserService } from '../../service/user.service';

//Manual import
import { ExaminersService, cSearch, cData } from '../../service/examiners.service';


@Component({
  selector: 'app-check-menu',
  templateUrl: './check-menu.component.html',
  styleUrls: ['./check-menu.component.css']
})
export class CheckMenuComponent implements OnInit {

    public message: MessageClass[] = [];

    public CountData      : number = 20;
    public CurrentPage    : number = 1;
    public AllPage        : number = 13;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public examiner_id        : number;

    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService,
        private service         : ExaminersService
    ) {
        //set inital value when open form

    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;

        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;

    }


}
