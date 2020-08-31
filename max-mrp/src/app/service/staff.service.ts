import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class StaffService {

  private BASE_URL  : string = environment.api_url+ '/staffController';
  private myHeaders: HttpHeaders =  new HttpHeaders({
    'Content-Type':  'application/json',
    'Authorization': localStorage.getItem('token')
  });
  constructor(
    private http:HttpClient
  ) { }

  public getListData(search_data: cSearch){
    search_data.token	= localStorage.getItem('token');

    let strJSON:string = JSON.stringify(search_data);
    return this.http.post(this.BASE_URL+'/get_data_list',strJSON);
  }

  public getListData2(search_data: cSearch){
    search_data.token	= localStorage.getItem('token');
    
    let strJSON:string = JSON.stringify(search_data);
    let myParam : HttpParams = new HttpParams();
    myParam.set('id2','1');
    myParam.set('type2','dddd');
    //params:myParam
    return this.http.get(this.BASE_URL+'/data_count/id/1/type/ddd',{headers:this.myHeaders});
  }

}


export class cSearch{
	token:string;
	sort_column:string;
	sort_direction:string;
	page_index:number;
	page_size:number;
	
	code:string;
	name:string;
}