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

    onCollapseClick(){
        alert(1);
        const body = document.getElementsByTagName('body')[0];

        body.classList.remove('sidebar-collapse');
        body.classList.add('sidebar-collapse');
        //sidebar-mini layout-fixed sidebar-collapse
    }
    
    onLogout() {
        this.user.logout();
        this.router.navigate(['/login']);
    }

}
