import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/LocationController';

@Injectable({
  providedIn: 'root'
})
export class LocationService {

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type'  : 'application/json',
      'Authorization' : localStorage.getItem('token')
    })
  };

  constructor(
    private http:HttpClient
  ) { }

  public getListData(search_data:cSearch){
    let strJSON:string = JSON.stringify(search_data);
    return this.http.post(BASE_URL+'/get_data_list',strJSON,this.httpOptions);
  }

  public deleteById(factory_code:string,location_code:string){
    let inputData = new cInput();
    
    inputData.factory_code = factory_code;console.log(inputData);
    inputData.location_code = location_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,this.httpOptions);
  }

  public getDataById(factory_code:string,location_code:string){
    let inputData = new cInput();
    inputData.factory_code           = factory_code;
    inputData.location_code          = location_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_data_by_id',strJSON,this.httpOptions);
  }

  public updateById(inputData:cInput){
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/update_data',strJSON,this.httpOptions);
  }

  public getFactory(){
    let strJSON:string  = '';
    return this.http.post(BASE_URL+'/get_factory',strJSON,this.httpOptions);
  }
}


export class cSearch{
  page_index  :number;
  rowsPerpage   :number;

  //manual search condition
  factory_code   : string;
  location_code  : string;
  location_name  : string;
  mrp_flag       : boolean;
  expire_flag    : boolean;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class cData{
  factory_code  : string;
  location_code : string;
  location_name : string;
  mrp_flag      : boolean;
  expire_flag   : boolean;
  remark        : string;
}

export class cInput{
  token         : string;
  old_factory   : string;
  old_location  : string;

  factory_code  : string;
  location_code : string;
  location_name : string;
  mrp_flag      : boolean;
  expire_flag   : boolean;
  remark        : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
