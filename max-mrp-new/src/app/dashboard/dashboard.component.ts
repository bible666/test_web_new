import { Component, OnInit } from '@angular/core';
import { UserService } from '../service/user.service';

@Component({
    selector: 'app-dashboard',
    templateUrl: './dashboard.component.html',
    styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

    constructor(
        private user : UserService,
    ) { }

    ngOnInit() {
        this.user.main_menu_selected = -1;
        this.user.sub_menu_selected  = -1;
    }

}
