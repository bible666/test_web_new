import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';

const BASE_URL = environment.api_url + '/userController';

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

    public deleteById( userId : number ) {
        this.setAuth();

        let inputData = new cInput();
        
        inputData.userId  = userId;
        let strJSON : string    = JSON.stringify( inputData );
        return this.http.post( BASE_URL + '/delete_data_by_id' , strJSON , this.httpOptions );
    }

    public getDataById( userId : number ) {
        this.setAuth();

        let inputData = new cInput();
        inputData.userId      = userId;
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
    dpt_code      : string;
    remark        : string;
}

export class cInput {
    oldUserId       : number;
    userId          : number;
    title           : number;
    firstName       : string;
    lastName        : string;
    gender          : string;
    joinDate        : Date;
    birthday        : Date;
    employeeId      : string;
    loginId         : string;
    userPassword    : string;
    userGroupId     : number;
    idCard          : string;
    taxId           : string;
    socialId        : string;
    educationLevel  : string;
    fieldOfStudy    : string;
    institution     : string;
    gpa             : string;
    address         : string;
    province        : string;
    postCode        : string;
    phone           : string;
    mobile          : string;
    eMail           : string;
    referenceName   : string;
    referencePhone  : string;
    bankName        : string;
    bankAccount     : string;
    remark          : string;

    public constructor( init? : Partial< cInput >) {
        Object.assign( this , init );
    }
}