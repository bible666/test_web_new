import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';


@Component({
    selector: 'my-main-sidebar-container',
    templateUrl: './my-main-sidebar-container.component.html',
    styleUrls: ['./my-main-sidebar-container.component.css']
})
export class MyMainSidebarContainerComponent implements OnInit {

    public menu_datas;

    constructor(
        public user    : UserService,
    ) { }

    ngOnInit() {
        let menu_datas = JSON.parse(localStorage.getItem('menu_data'));
        this.menu_datas = this.getMenuData('-1',menu_datas);
        console.log(this.menu_datas);
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


}
