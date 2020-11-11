import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';

const BASE_URL = environment.api_url + '/staffController';

@Injectable({
  providedIn : 'root'
})
export class StaffService {

    httpOptions = {
        headers: new HttpHeaders({
        'Content-Type'  : 'application/json',
        'Authorization' : localStorage.getItem('token')
        })
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
        private http : HttpClient
    ) { }

    public getListData( search_data : cSearch ) {
        this.setAuth();
        let strJSON : string = JSON.stringify( search_data );
        return this.http.post( BASE_URL + '/get_data_list' , strJSON , this.httpOptions );
    }

    public deleteById( staff_code : string ) {
        this.setAuth();

        let inputData = new cInput();
        
        inputData.staff_code  = staff_code;
        let strJSON : string    = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/delete_data_by_id' , strJSON , this.httpOptions );
    }

    public getDataById( staff_code : string ) {
        this.setAuth();

        let inputData = new cInput();
        inputData.staff_code      = staff_code;
        let strJSON : string        = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/get_data_by_id' , strJSON , this.httpOptions );
    }

    public updateById( inputData : cInput ) {
        this.setAuth();
        let strJSON : string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/update_data' , strJSON , this.httpOptions );
    }

}

export class cSearch {
    page_index    :number;
    rowsPerpage   :number;

    //manual search condition
    staff_code   : string;
    staff_name  : string;

    public constructor( init? : Partial< cSearch >) {
        Object.assign( this , init );
    }
}

export class cData {
    staff_code    : string;
    staff_name    : string;
    remark        : string;
}

export class cInput {
    old_staff_code : string;
    staff_code     : string;
    staff_name     : string;
    remark         : string;

    public constructor( init? : Partial< cInput >) {
        Object.assign( this , init );
    }
}