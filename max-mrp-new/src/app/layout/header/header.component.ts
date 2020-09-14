import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';
import { Router, RouterModule } from '@angular/router';

@Component({
    selector: 'my-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

    constructor(
        private user: UserService,
        private router: Router
    ) { }

    ngOnInit() {

    }

    onLogout() {
        this.user.logout();
        this.router.navigate(['/login']);
    }

}
