import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, UnitService } from '../../../service/unit.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from '../../../service/user.service';

@Component( {
    selector: 'app-unit-edit',
    templateUrl: './unit-edit.component.html',
    styleUrls: ['./unit-edit.component.css']
} )
export class UnitEditComponent implements OnInit {

    public message      : MessageClass[] = [];
    public submitted    : boolean = false;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public id                : string;
    public old_unit_code : string;
    
    inputForm = new FormGroup( {
        'unit_code'     : new FormControl( '' , [ Validators.required, Validators.maxLength(10) ]),
        'unit_name'     : new FormControl( '' , [ Validators.required, Validators.maxLength(50) ]),
        'remark'        : new FormControl( '' , [ Validators.maxLength(200) ])
    } );
    
    constructor(
        private param           : ActivatedRoute,
        private Service         : UnitService,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService
    ) { }

    ngOnInit() {
        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 39;
        
        window.scroll(0,0);

        this.old_unit_code    = this.param.snapshot.params.unit_code;


        if ( this.old_unit_code != '-1' ) {
            //get data from database
            this.Service.getDataById( this.old_unit_code ).subscribe(
                data => {

                    if ( data['status'] == 'success' ) {

                        this.inputForm.patchValue( {
                            'unit_code'   : data['data'].unit_code,
                            'unit_name'   : data['data'].unit_name,
                            'remark'          : data['data'].remark
                        });
                    } else {
                        this.ServiceMessage.setError(data['message']);
                        this.message = this.ServiceMessage.getMessage();
                    }
                },
                error => {
                    this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                    this.message = this.ServiceMessage.getMessage();
                }
            );
        }
    }

    onSubmit(){
        this.submitted = true;
        if ( this.inputForm.invalid ){
            return;
        }

        let input_data  : cInput = new cInput(this.inputForm.value);
        input_data.old_unit_code = this.old_unit_code;

        this.Service.updateById( input_data ).subscribe(
            data => {
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
                    this.router.navigateByUrl('/master/unit');
                } else {
                    this.ServiceMessage.setError(data['message']);
                    this.message = this.ServiceMessage.getMessage();
                }
            },
            error => {
                this.ServiceMessage.setError('บันทึกผิดพลาด');
                this.message = this.ServiceMessage.getMessage();
            }
        );
    }

}



