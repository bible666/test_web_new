import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from '../../service/user.service';
import { TranslateService } from '@ngx-translate/core';

//Manual add service for this page
import { ExaminersService, cInput } from '../../service/examiners.service';
import { ComboService, ComboData } from '../../service/combo.service';

@Component({
  selector: 'app-examiners-edit',
  templateUrl: './examiners-edit.component.html',
  styleUrls: ['./examiners-edit.component.css']
})
export class ExaminersEditComponent implements OnInit {
    public message      : MessageClass[] = [];
    public submitted    : boolean = false;
    public arGender     : ComboData[];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
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
        public translate        : TranslateService,
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService,
        private service         : ExaminersService,
        private comboService    : ComboService
    ) {
        translate.setDefaultLang('th');
    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;
        
        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;

        if ( this.examiner_id != -1 ) {
            //get data from database
            this.service.getDataById( this.examiner_id ).subscribe(
                data => {
                    if ( data['status'] == 'success' ) {
                        let myGender : ComboData = new ComboData();
                        myGender.display_code = "ชาย";
                        myGender.value_code = "M";

                        this.inputForm.patchValue( {
                            examiner_code  : data['data'].examiner_code,
                            first_name     : data['data'].first_name,
                            last_name      : data['data'].last_name,
                            birthdate      : data['data'].birthdate,
                            gender         : {"value_code": 'M', "display_code": 'ชาย'},
                            address        : data['data'].address,
                            remarks        : data['data'].remarks
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

    onGenderChange(event) {
        //event.query = current value in input field
        console.log(event.query);
        this.comboService.getData("get_gender_list",event.query).subscribe(
            data => {
                this.arGender = data['data'];
                console.log(this.arGender);
            }
        );
    }
}

export interface InputFormValue {
    examiner_code : string
    first_name    : string
    last_name     : string
    birthdate     : Date
    gender        : string
}
