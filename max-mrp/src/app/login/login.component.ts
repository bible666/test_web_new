import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { MessageService, MessageClass } from '../service/message.service';
import { UserService } from '../service/user.service';
import { Router } from '@angular/router';

@Component({
    selector    : 'app-login',
    templateUrl : './login.component.html',
    styleUrls   : ['./login.component.css']
})
export class LoginComponent implements OnInit {

    public message: MessageClass[] = [];

    inputForm = new FormGroup({
        'login_name'  : new FormControl(''),
        'login_pwd'   : new FormControl('')
    });

    constructor(
        private service : MessageService,
        private user    : UserService,
        private router  : Router
    ) {
        this.user.clear_cache();
    }

    ngOnInit() {
        this.message = this.service.getMessage();
    }

    onLogin(){
        console.log(1);
        this.user.login( this.inputForm.value ).subscribe (
            data => {
                if ( data['status'] == 'success' ) {
                    this.user.set_token(data['data']['token']);
                    this.user.set_company_id(data['data']['company_id']);
                    this.user.set_menu_data(data['menuData']);
                    this.router.navigateByUrl('/');
                }
            },
            ( err ) => {
                this.service.setError(err['error']['message']);
                this.user.clear_cache();
                this.message = this.service.getMessage();
            }
        );
    }

}
