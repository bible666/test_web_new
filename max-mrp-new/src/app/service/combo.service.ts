import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/ComboController';

@Injectable({
    providedIn: 'root'
})
export class ComboService {

    httpOptions = {
        headers: new HttpHeaders({
            'Content-Type'  : 'application/json',
            'Authorization' : localStorage.getItem('token')
        })
    };

    constructor(
        private http:HttpClient
    ) { }

    private setAuth(){
        this.httpOptions = {
            headers: new HttpHeaders({
                'Content-Type'  : 'application/json',
                'Authorization' : localStorage.getItem('token')
            })
        };
    }

    public getData(service_name:string,searchData:string = ""){
        this.setAuth();

        let strJSON:string  = JSON.stringify(searchData);
        return this.http.post(BASE_URL+'/'+service_name,strJSON,this.httpOptions);
    }
}

export class ComboDatas {
    public comboData      : ComboData[];

    
}

export class ComboData {
    public value_code      : string;
    public display_code    : string;
}

