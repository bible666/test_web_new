import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/CustomerController';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

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

  public deleteById(customer_code:string){
    let inputData = new cInput();
    
    inputData.customer_code = customer_code;
    let strJSON:string  = JSON.stringify(inputData);
    return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,this.httpOptions);
  }

  public getDataById(customer_code:string){
    let inputData = new cInput();
    inputData.customer_code           = customer_code;
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
  customer_code  : string;
  customer_name  : string;

  public constructor(init?: Partial<cSearch>){
      Object.assign(this,init);
   }
}

export class cData{
  customer_code     : string;
  customer_name     : string;

  remark        : string;
}

export class cInput{
  token                : string;
  old_customer_code    : string;

  customer_code         : string;
  customer_name         : string;
  address               : string;
  post_code             : string;
  tel_no                : string;
  fax_no                : string;
  e_mail                : string;
  contact               : string;
  delivery_time   : number;
  tax_id                : string;
  payment_tearm         : string;
  remark                : string;

  public constructor(init?: Partial<cInput>){
    Object.assign(this,init);
  }
}

