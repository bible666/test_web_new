import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { LoadingService } from '../../../service/loading.service';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { tap, finalize,map } from 'rxjs/operators';
import { cInput, StaffService } from '../../../service/staff.service';

@Component({
    selector    : 'app-customer-edit',
    templateUrl : './user-edit.component.html',
    styleUrls   : ['./user-edit.component.css']
})
export class UserEditComponent implements OnInit {

    public message :       MessageClass[] = [];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    oldUserId  : number = -1;
    
    inputForm = new FormGroup({
        'userId'            : new FormControl(-1),
        'title'             : new FormControl(-1),
        'firstName'         : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
        'lastName'          : new FormControl('', [ Validators.maxLength(200) ]),
        'gender'            : new FormControl('', [ Validators.maxLength(1) ]),
        'joinDate'          : new FormControl(''),
        'birthday'          : new FormControl(''),
        'employeeId'        : new FormControl('', [ Validators.maxLength(50) ]),
        'loginId'           : new FormControl('', [ Validators.required, Validators.maxLength(100) ]),
        'userPassword'      : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
        'userGroupId'       : new FormControl(-1),
        'idCard'            : new FormControl('', [ Validators.maxLength(20) ]),
        'taxId'             : new FormControl('', [ Validators.maxLength(20) ]),
        'socialId'          : new FormControl('', [ Validators.maxLength(20) ]),
        'educationLevel'    : new FormControl('', [ Validators.maxLength(20) ]),
        'fieldOfStudy'      : new FormControl('', [ Validators.maxLength(50) ]),
        'institution'       : new FormControl('', [ Validators.maxLength(100) ]),
        'gpa'               : new FormControl('', [ Validators.maxLength(10) ]),
        'address'           : new FormControl('', [ Validators.maxLength(1000) ]),
        'province'          : new FormControl('', [ Validators.maxLength(100) ]),
        'postCode'          : new FormControl('', [ Validators.maxLength(50) ]),
        'phone'             : new FormControl('', [ Validators.maxLength(50) ]),
        'mobile'            : new FormControl('', [ Validators.maxLength(50) ]),
        'eMail'             : new FormControl('', [ Validators.maxLength(50) ]),
        'referenceName'     : new FormControl('', [ Validators.maxLength(200) ]),
        'referencePhone'    : new FormControl('', [ Validators.maxLength(50) ]),
        'bankName'          : new FormControl('', [ Validators.maxLength(100) ]),
        'bankAccount'       : new FormControl('', [ Validators.maxLength(50) ]),
        'remark'            : new FormControl('', [ Validators.maxLength(200) ])
    });

    constructor(
        private param           : ActivatedRoute,
        private Service         : StaffService,
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
        
        this.oldUserId    = this.param.snapshot.params.userId;

        if ( this.oldUserId != -1 ) {
            //get data from database
            this.Service.getDataById( this.oldUserId )
            .pipe(
                tap( () => { this.loading.show(); } ) ,
                finalize( () => {
                    this.loading.hide();
                }),
                map( 
                    data => {
                        if ( data['status'] == 'success' ){
                            this.inputForm.patchValue({
                                'title'             : data['data'].title,
                                'firstName'         : data['data'].first_name,
                                'lastName'          : data['data'].last_name,
                                'gender'            : data['data'].gender,
                                'joinDate'          : data['data'].join_date,
                                'birthday'          : data['data'].birthday,
                                'employeeId'        : data['data'].employee_id,
                                'loginId'           : data['data'].login_id,
                                'userPassword'      : data['data'].user_password,
                                'userGroupId'       : data['data'].user_group_id,
                                'idCard'            : data['data'].id_card,
                                'taxId'             : data['data'].tax_id,
                                'socialId'          : data['data'].social_id,
                                'educationLevel'    : data['data'].education_level,
                                'fieldOfStudy'      : data['data'].field_of_study,
                                'institution'       : data['data'].institution,
                                'gpa'               : data['data'].gpa,
                                'address'           : data['data'].address,
                                'province'          : data['data'].province,
                                'postCode'          : data['data'].post_code,
                                'phone'             : data['data'].phone,
                                'mobile'            : data['data'].mobile,
                                'eMail'             : data['data'].e_mail,
                                'referenceName'     : data['data'].reference_name,
                                'referencePhone'    : data['data'].reference_phone,
                                'bankName'          : data['data'].bank_name,
                                'bankAccount'       : data['data'].bank_account,
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

        let inputData	: cInput = new cInput(this.inputForm.value);
        inputData.oldUserId = this.oldUserId;

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
                    
                    this.router.navigateByUrl('/master/user');
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

