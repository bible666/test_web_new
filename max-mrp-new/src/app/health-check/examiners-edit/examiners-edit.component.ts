import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { ComboData } from '../../service/combo.service';
import { UserService } from '../../service/user.service';

import { ExaminersService, cInput } from '../../service/examiners.service';

//import { cInput, UnitService } from '../../service/unit.service';

@Component({
  selector: 'app-examiners-edit',
  templateUrl: './examiners-edit.component.html',
  styleUrls: ['./examiners-edit.component.css']
})
export class ExaminersEditComponent implements OnInit {
    public message      : MessageClass[] = [];
    public submitted    : boolean = false;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public genderType         : string         = "gender";
    public genderCode$        : Observable<string>;
    public examiner_id        : number;

    inputForm = new FormGroup( {
        'area_id'       : new FormControl( '' , [  ]),
        'examiner_code' : new FormControl( '' , [ Validators.required, Validators.maxLength(10) ]),
        'first_name'    : new FormControl( '' , [ Validators.required, Validators.maxLength(200) ]),
        'last_name'     : new FormControl( '' , [ Validators.maxLength(200) ]),
        'birthdate'     : new FormControl( '' , [ Validators.required, Validators.maxLength(50) ]),
        'gender'        : new FormControl( '' , [ ]),
        'prefectures'   : new FormControl( '' , [ ]),
        'address'       : new FormControl( '' , [ ]),
        'remarks'       : new FormControl( '' , [ Validators.maxLength(400) ])
    } );

    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService,
        private service         : ExaminersService

        // private Service         : UnitService,
    ) { }

    ngOnInit(): void {
        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 39;
        
        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;

        if ( this.examiner_id != -1 ) {
            //get data from database
            this.service.getDataById( this.examiner_id ).subscribe(
                data => {
                    if ( data['status'] == 'success' ) {
                        this.inputForm.patchValue( {
                            'examiner_code'  : data['data'].examiner_code,
                            'first_name'     : data['data'].first_name,
                            'last_name'      : data['data'].last_name,
                            'birthdate'      : data['data'].birthdate
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
        input_data.id = this.examiner_id;

        this.service.updateById( input_data ).subscribe(
            data => {
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
                    this.router.navigateByUrl('/health/examiners');
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

    onGenderSelect( data: ComboData ){
        this.inputForm.patchValue({
            'gender'             : data.value_code
        });
    }

}
