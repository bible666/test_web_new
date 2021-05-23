import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/PrgExaminersFraAController';

@Injectable({
    providedIn: 'root'
})
export class PrgExaminersFraAService {

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
    page_index    : number;
    rowsPerpage   : number;

    //manual search condition
    examiner_code   : string;
    examiner_name   : string;
    examiner_date   : Date;

    public constructor( init? : Partial< cSearch > ){
        Object.assign( this , init );
    }
}

export class cData{
    examiner_code   : string;
    examiner_name   : string;
}

export class cInput{
    token       : string;
    id          : number;

    examiner_id : number;
    exam_date   : Date;
    question_1  : boolean;
    question_2  : boolean;
    question_3  : boolean;
    question_4  : boolean;
    question_5  : boolean;
    question_6  : boolean;
    question_7  : boolean;
    question_8  : boolean;
    question_9  : boolean;
    question_10 : boolean;
    question_11 : boolean;
    question_12 : boolean;
    question_13 : boolean;
    question_14 : boolean;
    question_15 : boolean;
    question_16 : boolean;
    question_17 : boolean;
    question_18 : boolean;
    question_19 : boolean;
    question_20 : boolean;
    question_21 : boolean;
    question_22 : boolean;
    question_23 : boolean;
    question_24 : boolean;
    question_25 : boolean;
    remarks     : string;
    height      : number;
    weight      : number;

    public constructor( init? : Partial< cInput >){
        Object.assign( this , init );
    }
}

export class GetDataById{
    token       : string;
    id          : number;

    examiner_id : number;
    exam_date   : Date;
    question_1  : boolean;
    question_2  : boolean;
    question_3  : boolean;
    question_4  : boolean;
    question_5  : boolean;
    question_6  : boolean;
    question_7  : boolean;
    question_8  : boolean;
    question_9  : boolean;
    question_10 : boolean;
    question_11 : boolean;
    question_12 : boolean;
    question_13 : boolean;
    question_14 : boolean;
    question_15 : boolean;
    question_16 : boolean;
    question_17 : boolean;
    question_18 : boolean;
    question_19 : boolean;
    question_20 : boolean;
    question_21 : boolean;
    question_22 : boolean;
    question_23 : boolean;
    question_24 : boolean;
    question_25 : boolean;
    remarks     : string;
    height      : number;
    weight      : number;

    public constructor( init? : Partial< cInput >){
        Object.assign( this , init );
    }
}
