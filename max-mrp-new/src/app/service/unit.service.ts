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

    private setAuth(){
        this.httpOptions = {
            headers: new HttpHeaders({
                'Content-Type'  : 'application/json',
                'Authorization' : localStorage.getItem('token')
            })
        };
    }

    constructor(
        private http:HttpClient
    ) { }

    public getListData(search_data:cSearch){
        this.setAuth();

        let strJSON:string = JSON.stringify(search_data);
        return this.http.post(BASE_URL+'/get_data_list',strJSON,this.httpOptions);
    }

    public deleteById(unitCode:string){
        this.setAuth();

        let inputData = new cInput();
        
        inputData.unit_code = unitCode;
        let strJSON:string  = JSON.stringify(inputData);
        return this.http.post(BASE_URL+'/delete_data_by_id',strJSON,this.httpOptions);
    }

    public getDataById(item_code:string){
        this.setAuth();

        let inputData         = new cInput();
        inputData.unit_code   = item_code;
        let strJSON:string    = JSON.stringify(inputData);
        return this.http.post(BASE_URL+'/get_data_by_id',strJSON,this.httpOptions);
    }

    public updateById(inputData:cInput){
        this.setAuth();

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
}

export class cInput{
    token                : string;
    old_unit_code        : string;

    unit_code            : string;
    unit_name            : string;
    remark               : string;

    public constructor(init?: Partial<cInput>){
        Object.assign(this,init);
    }
}
