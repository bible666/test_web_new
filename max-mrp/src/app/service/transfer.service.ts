import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL      = environment.api_url+'/ItemController';
const LOCATION_URL  = environment.api_url+'/LocationController';

@Injectable({
  providedIn: 'root'
})
export class TransferService {

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type'  : 'application/json',
      'Authorization' : localStorage.getItem('token')
    })
  };

  constructor(
    private http:HttpClient
  ) { }

  public getLocation(){
    return this.http.post(LOCATION_URL+'/get_location_for_department','',this.httpOptions);
  }

  public getLotNo(location_code:string,item_code:string){
    let inputData = new cGetLotNo();
    inputData.location_code          = location_code;
    inputData.item_code              = item_code;
    return this.http.post(BASE_URL+'/get_lot_no_by_location_item',inputData,this.httpOptions);
  }

}

export class cGetLotNo{
    location_code:  string;
    item_code:      string;
}
