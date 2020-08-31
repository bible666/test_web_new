import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { BehaviorSubject } from 'rxjs';

const BASE_URL = environment.api_url;

interface MenuNode {
	name: string;
	URL: string;
	image: string;
	children?: MenuNode[];
}

//const headers = new HttpHeaders().set("Authorization", "custom header value");
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    'Authorization': 'my-auth-token'
  })
};

@Injectable({
  providedIn: 'root'
})
export class UserService {

  Menu_Data: MenuNode[];
  public menu_datas;

  private MenuDataSource = new BehaviorSubject(this.Menu_Data);
  currentMenuDataSource = this.MenuDataSource.asObservable();

  constructor(
    private http:HttpClient
  ) { }

  changeMenu(newMenu: MenuNode[]){
    this.MenuDataSource.next(newMenu);
  }

  public getUser(){
    return this.http.get(BASE_URL+'ode.com/todos/1');
     
  }

  public getMenu(){
    let httpData : cGetMenu = new cGetMenu();
    httpData.token	= localStorage.getItem('token');
    return this.http.post(BASE_URL+'/UserController/getMenu',JSON.stringify(httpData));
  }

  public clear_cache(){
    localStorage.clear();
  }

  public login(pData){
    let httpData : cLogin = new cLogin();
    httpData.user_login     = pData['login_name'];
    httpData.user_password  = pData['login_pwd'];
    return this.http.post(BASE_URL+'/UserController/login',JSON.stringify(httpData),httpOptions);
  }

  public logout(){
    localStorage.clear();
  }

  public set_token(p_token){
    localStorage.setItem('token', p_token);
  }

  public get_token(){
    return localStorage.getItem('token');
  }

  public set_menu_data(p_menu_data){
    localStorage.setItem('menu_data', JSON.stringify(p_menu_data));
  }

  public get_menu_data(p_menu_id){
    let ret_data: Array<any> = [];
    if (localStorage.getItem('menu_data')){
      let menu_datas = JSON.parse(localStorage.getItem('menu_data'));
      menu_datas.forEach(data => {
        if (data.parent_menu_id === p_menu_id){
          ret_data.push(data);
        }
        
      });
    }
    
    return ret_data;
  }

  public set_company_id(p_company_id){
    localStorage.setItem('company_id', p_company_id);
  }

  public get_company_id(){
    return localStorage.getItem('company_id');
  }
}

class cLogin{
  user_login:string;
  user_password:string;
}

class cGetMenu{
	token:string;
}
