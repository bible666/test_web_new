import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, RouterEvent, NavigationEnd } from '@angular/router';
import { UserService } from '../../service/user.service';
import { filter, delay } from 'rxjs/operators';

@Component({
  selector: 'app-main-menu',
  templateUrl: './main-menu.component.html',
  styleUrls: ['./main-menu.component.css']
})
export class MainMenuComponent implements OnInit {

  public message: string;

  public menu_id: string = '-1';
  public menu_datas;
  public con_menu_id:number = -1;

  constructor(
    private router: Router,
    private param: ActivatedRoute,
    public user: UserService
  ) { 
	//Constructor code
	if (this.param.snapshot.params.menu_id) {
		this.con_menu_id    = this.param.snapshot.params.menu_id;
	}
    //console.log(this.menu_id);
    //this.user.menu_datas = this.user.get_menu_data(this.menu_id);
  }

  ngOnInit() {
    window.scroll(0,0);

    this.router.events.pipe(
      filter((event: RouterEvent) => event instanceof NavigationEnd)
    ).subscribe(router_data => {
      console.log(router_data.url);
      if (router_data.url == '/'){
        this.menu_id = '-1';
      }else {
        let arr = router_data.url.split('/');

        this.menu_id = arr[arr.length -1];
      }
      
      //if (this.param.snapshot.params.menu_id) {
      //  this.menu_id    = this.param.snapshot.params.menu_id;
    // }

        this.user.menu_datas = this.user.get_menu_data(this.menu_id);
    });
    
  }

  onMenuChange(menu_id){
	//this.user.menu_datas = this.user.get_menu_data(menu_id);
	


    //this.menu_datas = this.user.menu_datas;
  }

  onTemplateClick(){
    this.router.navigateByUrl('/template/list');
  }

}
