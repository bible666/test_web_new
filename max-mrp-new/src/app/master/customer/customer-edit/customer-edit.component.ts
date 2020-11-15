import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, CustomerService } from '../../../service/customer.service';
import { LoadingService } from '../../../service/loading.service';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { tap, finalize,map } from 'rxjs/operators';

@Component({
    selector    : 'app-customer-edit',
    templateUrl : './customer-edit.component.html',
    styleUrls   : ['./customer-edit.component.css']
})
export class CustomerEditComponent implements OnInit {

    public message :       MessageClass[] = [];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    oldCustomerCode  : string;
    
    inputForm = new FormGroup({
        'customerCode'    : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'customerName'    : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
        'address'         : new FormControl('', [ Validators.maxLength(200) ]),
        'postCode'        : new FormControl('', [ Validators.maxLength(10) ]),
        'telNo'           : new FormControl('', [ Validators.maxLength(50) ]),
        'faxNo'           : new FormControl('', [ Validators.maxLength(50) ]),
        'e_mail'          : new FormControl('', [ Validators.maxLength(100),Validators.email ]),
        'contact'         : new FormControl('', [ Validators.maxLength(100) ]),
        'deliveryTime'    : new FormControl('', [ Validators.max(999)]),
        'tax_id'          : new FormControl('', [ Validators.maxLength(20) ]),
        'paymentTearm'    : new FormControl('', [ Validators.maxLength(200) ]),
        'remark'          : new FormControl('', [ Validators.maxLength(200) ])
    
    });
  
    constructor(
        private param           : ActivatedRoute,
        private Service         : CustomerService,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private loading         : LoadingService,
        private userData        : UserService 
    ) { 

    }

    ngOnInit() {
        window.scroll( 0 , 0 );

        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 45;
        
        this.oldCustomerCode    = this.param.snapshot.params.customerCode;

        if ( this.oldCustomerCode != '-1' ) {
            //get data from database
            this.Service.getDataById( this.oldCustomerCode )
            .pipe(
                tap( () => { this.loading.show(); } ) ,
                finalize( () => {
                    this.loading.hide();
                }),
                map( 
                    data => {
                        if ( data['status'] == 'success' ){
                            this.inputForm.patchValue({
                                'customerCode'    : data['data'].customer_code,
                                'customerName'    : data['data'].customer_name,
                                'address'         : data['data'].address,
                                'postCode'        : data['data'].post_code,
                                'telNo'           : data['data'].tel_no,
                                'faxNo'           : data['data'].fax_no,
                                'e_mail'          : data['data'].e_mail,
                                'contact'         : data['data'].contact,
                                'deliveryTime'    : data['data'].delivery_time,
                                'tax_id'          : data['data'].tax_id,
                                'paymentTearm'    : data['data'].payment_tearm,
                                'remark'          : data['data'].remark
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

        let inputData	: cInput = new cInput(this.inputForm.value);
        inputData.old_customer_code = this.oldCustomerCode;

        //upload image

        this.Service.updateById(inputData)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(
            data=>{
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                    
                    this.router.navigateByUrl('/master/customer');
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

