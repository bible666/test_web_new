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
        const body = document.getElementsByTagName('body')[0];

        if ( this.user.is_Collapse ) {
            this.user.is_Collapse = false;
            body.classList.remove('sidebar-collapse');
        } else {
            this.user.is_Collapse = true;
            body.classList.add('sidebar-collapse');
        }
        
        
        //sidebar-mini layout-fixed sidebar-collapse
    }
    
    onLogout() {
        this.user.logout();
        this.router.navigate(['/login']);
    }

}
