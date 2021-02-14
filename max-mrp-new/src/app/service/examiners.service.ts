import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/ExaminersController';

@Injectable({
    providedIn: 'root'
})
export class ExaminersService {

    httpOptions = {
        headers: new HttpHeaders({
            'Content-Type'  : 'application/json',
            'Authorization' : localStorage.getItem('token')
        })
    };

    private setAuth() {
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

    public getListData( search_data : cSearch ) {
        this.setAuth();
        let strJSON:string = JSON.stringify( search_data );
        return this.http.post( BASE_URL + '/get_data_list' , strJSON , this.httpOptions );
    }

    public deleteById( id : number ) {
        this.setAuth();
        let inputData = new cInput();
        inputData.id = id;
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/delete_data_by_id' , strJSON , this.httpOptions );
    }

    public getDataById( id : number ) {
        this.setAuth();
        let inputData = new cInput();
        inputData.id = id;
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/get_data_by_id' , strJSON , this.httpOptions );
    }

    public updateById( inputData : cInput ) {
        this.setAuth();
        let strJSON:string  = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/update_data' , strJSON , this.httpOptions );
    }
}


export class cSearch{
    page_index    :number;
    rowsPerpage   :number;

    //manual search condition
    examiner_code   :string;
    examiner_name   :string;

    public constructor( init? : Partial< cSearch > ){
        Object.assign( this , init );
    }
}

export class cData{
    examiner_code   : string;
    examiner_name   : string;
}

export class cInput{
    token         : string;
    id            : number;

    old_examiner_code : string;
    examiner_code     : string;
    area_id           : number;
    first_name        : string;
    last_name         : string;
    birthdate         : Date;
    gender            : string;
    prefectures       : number;
    address           : string;
    remarks           : string;

    public constructor( init? : Partial< cInput >){
        Object.assign( this , init );
    }
}
