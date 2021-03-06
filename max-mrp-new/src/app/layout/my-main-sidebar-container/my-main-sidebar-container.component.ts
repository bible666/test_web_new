import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: 'my-main-sidebar-container',
    templateUrl: './my-main-sidebar-container.component.html',
    styleUrls: ['./my-main-sidebar-container.component.css']
})
export class MyMainSidebarContainerComponent implements OnInit {

    public menu_datas;

    constructor(
        public user    : UserService,
        private router : Router
    ) { }

    ngOnInit() {
        let menu_datas = JSON.parse(localStorage.getItem('menu_data'));
        if ( !menu_datas ) {
            this.router.navigate(['/login']);
        }
        this.menu_datas = this.getMenuData('-1',menu_datas);
    }

    private getMenuData(menuId:string,menu_datas) {
        let ret_menu: Array<any> = [];
        menu_datas.forEach(data => {
            if (data.parent_menu_id == menuId){
                let child_menu;
                child_menu = this.getMenuData(data.menu_id,menu_datas);
                data.child_menu = child_menu;
                ret_menu.push(data);
            }
        });
        return ret_menu;
    }

    private onMainMenuClick(menu_id:string){
        if ( this.user.main_menu_open.indexOf(menu_id) !== -1 ){
            this.user.main_menu_open.splice(this.user.main_menu_open.indexOf(menu_id),1);
        } else {
            this.user.main_menu_open.push(menu_id);
        }
        
    }


}
