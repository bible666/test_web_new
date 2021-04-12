import { Component, OnInit } from '@angular/core';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from '../../service/user.service';
import { TranslateService } from '@ngx-translate/core';
import { LanguageService } from '../../service/language.service';

//Manual import


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
        public translate        : TranslateService,
        public lang             : LanguageService,
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService,
    ) {
        translate.setDefaultLang(lang.defaultLang);
        //set inital value when open form

    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;

        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;

    }


}
