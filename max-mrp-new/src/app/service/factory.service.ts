import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url + '/FactoryController';

@Injectable( {
    providedIn : 'root'
} )
export class FactoryService {

    httpOptions = {
        headers: new HttpHeaders ( {
            'Content-Type'  : 'application/json',
            'Authorization' : localStorage.getItem( 'token' )
        } )
    };

    private setAuth() {
        this.httpOptions = {
            headers: new HttpHeaders( {
                'Content-Type'  : 'application/json',
                'Authorization' : localStorage.getItem( 'token' )
            } )
        };
    }

    constructor(
        private http:HttpClient
    ) { }

    public getListData( search_data : cSearch ) {
        this.setAuth();
        let strJSON:string = JSON.stringify( search_data );
        return this.http.post( BASE_URL + '/get_data_list' , strJSON , this.httpOptions );
    }

    public deleteById( company_code : string , factory_code : string ) {
        this.setAuth();
        let inputData = new cInput( );
        inputData.company_code = company_code;
        inputData.factory_code = factory_code;
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/delete_data_by_id' , strJSON , this.httpOptions );
    }

    public getDataById( company_code : string , factory_code : string ) {
        this.setAuth();
        let inputData = new cInput( );
        inputData.company_code = company_code;
        inputData.factory_code = factory_code;
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/get_data_by_id' , strJSON , this.httpOptions );
    }

    public updateById( inputData : cInput ) {
        this.setAuth();
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/update_data' , strJSON , this.httpOptions );
    }

    public getCalendar() {
        this.setAuth();
        let strJSON:string  = '';
        return this.http.post( BASE_URL + '/get_calendar' , strJSON , this.httpOptions );
    }

    public getCompany() {
        this.setAuth();
        let strJSON:string  = '';
        return this.http.post( BASE_URL + '/get_company' , strJSON , this.httpOptions );
    }
}


export class cSearch{
    page_index    :number;
    rowsPerpage   :number;

    //manual search condition
    company_code   : string;
    factory_code   : string;
    factory_name   : string;
    address        : string;
    telno          : string;
    remark         : string;

    public constructor( init? : Partial< cSearch > ) {
        Object.assign( this , init );
    }
}

export class cData{
    company_code  : string;
    factory_code  : string;
    factory_name  : string;
    addr_1        : string;
    addr_2        : string;
    addr_3        : string;

    telno         : string;
    faxno         : string;
    email         : string;
    cal_no        : number;
    remark        : string;
}

export class cInput{
    token         : string;
    old_company   : string;
    old_factory   : string;

    company_code  : string;
    factory_code  : string;
    factory_name  : string;
    addr_1        : string;
    addr_2        : string;
    addr_3        : string;
    telno         : string;
    faxno         : string;
    email         : string;
    cal_no        : number;
    remark        : string;

    public constructor( init? : Partial< cInput > ) {
        Object.assign( this , init );
    }
}
