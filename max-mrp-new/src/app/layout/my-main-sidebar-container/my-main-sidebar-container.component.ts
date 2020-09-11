import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';

@Component({
    selector: 'my-main-sidebar-container',
    templateUrl: './my-main-sidebar-container.component.html',
    styleUrls: ['./my-main-sidebar-container.component.css']
})
export class MyMainSidebarContainerComponent implements OnInit {

    constructor(
        public user    : UserService,
    ) { }

    ngOnInit() {
        console.log(this.user.get_user_name());
    }

}
