import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url + '/SupplierController';

@Injectable( {
    providedIn : 'root'
} )
export class SupplierService {

    httpOptions = {
        headers: new HttpHeaders( {
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
        private http : HttpClient
    ) { }

    public getListData( search_data : cSearch ) {
        this.setAuth();

        let strJSON : string = JSON.stringify( search_data );
        return this.http.post( BASE_URL + '/get_data_list' , strJSON , this.httpOptions );
    }

    public deleteById( supplier_code : string ) {
        this.setAuth();

        let inputData = new cInput();
        
        inputData.supplier_code = supplier_code;
        let strJSON : string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/delete_data_by_id' , strJSON , this.httpOptions );
    }

    public getDataById( supplier_code : string ) {
        this.setAuth();

        let inputData         = new cInput();
        inputData.supplier_code   = supplier_code;
        let strJSON : string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/get_data_by_id' , strJSON , this.httpOptions );
    }

    public updateById( inputData : cInput ) {
        this.setAuth();

        let strJSON : string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/update_data' , strJSON , this.httpOptions );
    }

}

export class cGetDataList {
    location_code  :   string;
    item_name      :   string;
}

export class cSearch {
    page_index    : number;
    rowsPerpage   : number;

    //manual search condition
    item_code  : string;
    item_name  : string;

    public constructor(init? : Partial< cSearch >){
        Object.assign( this , init );
    }
}

export class cData {
    supplier_code     : string;
    supplier_name     : string;
    remark            : string;
}

export class cInput {
    token               : string;
    old_supplier_code    : string;

    supplier_code   : string;
    supplier_name   : string;
    address         : string;
    post_code       : string;
    tel_no          : string;
    fax_no          : string;
    e_mail          : string;
    contact         : string;
    delivery_time   : number;
    tax_id          : string;
    payment_tearm   : string;
    remark          : string;

    public constructor( init? : Partial< cInput >){
        Object.assign( this , init );
    }
}
