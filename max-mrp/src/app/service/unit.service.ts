import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/UnitController';

@Injectable({
  providedIn: 'root'
})
export class UnitService {

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

  public deleteById(unit_code:string){
    let inputData = new cInput();
    
    inputData.unit_code = unit_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,this.httpOptions);
  }

  public getDataById(unit_code:string){
    let inputData = new cInput();
    inputData.unit_code          = unit_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/get_data_by_id',strJSON,this.httpOptions);
  }

  public updateById(inputData:cInput){
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/update_data',strJSON,this.httpOptions);
  }

}


export class cSearch{
  page_index  :number;
  rowsPerpage   :number;

  //manual search condition
  unit_code  : string;
  unit_name  : string;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class cData{
  unit_code : string;
  unit_name : string;
  remark        : string;
}

export class cInput{
  token         : string;
  old_unit_code : string;

  unit_code : string;
  unit_name : string;
  remark        : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}
