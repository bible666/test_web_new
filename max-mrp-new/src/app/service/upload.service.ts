import { HttpClient, HttpHeaders, HttpEvent, HttpErrorResponse, HttpEventType } from  '@angular/common/http';  
import { map } from  'rxjs/operators';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';

const BASE_URL = environment.api_url+'/UploadFileController';

@Injectable({  
    providedIn: 'root'  
})  
export class UploadService { 

    httpOptions = {
        headers: new HttpHeaders({
        'Authorization' : localStorage.getItem('token')
        })
    };

    constructor(private http: HttpClient) { }

    public upload(formData : FormData) {
        return this.http.post<any>(BASE_URL+'/upload_file',formData,this.httpOptions);
       
    }
}