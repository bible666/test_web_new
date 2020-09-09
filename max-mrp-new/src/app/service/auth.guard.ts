import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { UserService } from './user.service';

//import { AuthenticationService } from '@/_services';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {
    constructor(
        private router: Router,
        private userService: UserService
        //private authenticationService: AuthenticationService
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

        if (this.userService.get_token() ) {
            // authorised so return true
            return true;
        }

        // not logged in so redirect to login page with the return url
        this.router.navigate(['/login']);//, { queryParams: { returnUrl: state.url }});
        return false;
    }
}