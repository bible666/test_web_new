import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, CurrencyService } from '../../../service/currency.service';
import { LoadingService } from '../../../service/loading.service';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { tap, finalize,map } from 'rxjs/operators';

@Component({
    selector: 'app-currency-edit',
    templateUrl: './currency-edit.component.html',
    styleUrls: ['./currency-edit.component.css']
})
export class CurrencyEditComponent implements OnInit {

    public message :       MessageClass[] = [];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    old_currency_code  : string;
    
    inputForm = new FormGroup({
        'currency_code'     : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'currency_name'     : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'default_currency'  : new FormControl(''),
        'remark'            : new FormControl('', [ Validators.maxLength(200) ])
    });
  
    constructor(
        private param           : ActivatedRoute,
        private Service         : CurrencyService,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private loading         : LoadingService,
        private userData        : UserService 
    ) { 

    }

    ngOnInit() {
        window.scroll( 0 , 0 );

        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 40;
        
        this.old_currency_code    = this.param.snapshot.params.currency_code;

        if ( this.old_currency_code != '-1' ) {
            //get data from database
            this.Service.getDataById( this.old_currency_code )
            .pipe(
                tap( () => { this.loading.show(); } ) ,
                finalize( () => {
                    this.loading.hide();
                }),
                map( 
                    data => {
                        if ( data['status'] == 'success' ){
                            this.inputForm.patchValue({
                                'currency_code'     : data['data'].currency_code,
                                'currency_name'     : data['data'].currency_name,
                                'default_currency'  : data['data'].default_currency== 1 ? true:false,
                                'remark'            : data['data'].remark
                            });
                        } else {
                            this.ServiceMessage.setError( data['message'] );
                            this.message = this.ServiceMessage.getMessage();
                        }
                    }
                )
            )
            .subscribe( data => {

            },
            error => {
                this.ServiceMessage.setError( 'เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้' );
                this.message = this.ServiceMessage.getMessage();
                
            });
        }
        
    }

    onSubmit(){

        if ( this.inputForm.invalid ) {
            return;
        }

        let input_data	: cInput = new cInput(this.inputForm.value);
        input_data.old_currency_code = this.old_currency_code;

        //upload image

        this.Service.updateById(input_data)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(
            data=>{
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                    
                    this.router.navigateByUrl('/master/currency');
                        } else {
                    this.ServiceMessage.setError(data['message']);
                    this.message = this.ServiceMessage.getMessage();
                }
            },
            error=>{
                this.ServiceMessage.setError('บันทึกผิดพลาด');
                this.message = this.ServiceMessage.getMessage();
            }
        );

    }

}
