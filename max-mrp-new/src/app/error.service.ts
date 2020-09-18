import { Injectable } from '@angular/core';
import { 
    HttpEvent, HttpRequest, HttpHandler, 
    HttpInterceptor, HttpErrorResponse 
} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { Router } from '@angular/router';

@Injectable()
export class ServerErrorInterceptor implements HttpInterceptor {

    constructor(
        private router  : Router
    ) {}

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        return next.handle(request).pipe(
            retry(1),
            catchError((error: HttpErrorResponse) => {
                if (error.status === 401) {
                    // refresh token
                    alert('Token Error');
                    this.router.navigateByUrl('/logout');
                } else {
                    return throwError(error);
                }
            })
        );    
    }
}