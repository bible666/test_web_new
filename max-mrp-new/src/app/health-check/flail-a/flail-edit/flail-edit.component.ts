import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { UserService } from '../../../service/user.service';
import { TranslateService } from '@ngx-translate/core';
import { LanguageService } from '../../../service/language.service';

//Manual add service for this page
import { PrgExaminersFraAService, cInput } from '../../../service/prgExaminersFraA.service';

@Component({
    selector: 'app-flail-edit',
    templateUrl: './flail-edit.component.html',
    styleUrls: ['./flail-edit.component.css']
})
export class FlailEditComponent implements OnInit {
    public message      : MessageClass[] = [];
    public submitted    : boolean = false;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public id           : number;
    public examiner_id  : number;
    public bmi          : string;

    DateObj = new Date();

    inputForm = new FormGroup( {
        'examiner_id'   : new FormControl(''),
        'exam_date'     : new FormControl(this.DateObj.getFullYear() + '-' + ('0' + (this.DateObj.getMonth() + 1)).slice(-2) + '-' + ('0' + this.DateObj.getDate()).slice(-2), [ Validators.required ]),
        'question_1'    : new FormControl('' , [ Validators.required ]),
        'question_2'    : new FormControl('' , [ Validators.required ]),
        'question_3'    : new FormControl('' , [ Validators.required ]),
        'question_4'    : new FormControl('' , [ Validators.required ]),
        'question_5'    : new FormControl('' , [ Validators.required ]),
        'question_6'    : new FormControl('' , [ Validators.required ]),
        'question_7'    : new FormControl('' , [ Validators.required ]),
        'question_8'    : new FormControl('' , [ Validators.required ]),
        'question_9'    : new FormControl('' , [ Validators.required ]),
        'question_10'   : new FormControl('' , [ Validators.required ]),
        'question_11'   : new FormControl('' , [ Validators.required ]),
        'question_12'   : new FormControl('' , [ Validators.required ]),
        'question_13'   : new FormControl('' , [ Validators.required ]),
        'question_14'   : new FormControl('' , [ Validators.required ]),
        'question_15'   : new FormControl('' , [ Validators.required ]),
        'question_16'   : new FormControl('' , [ Validators.required ]),
        'question_17'   : new FormControl('' , [ Validators.required ]),
        'question_18'   : new FormControl('' , [ Validators.required ]),
        'question_19'   : new FormControl('' , [ Validators.required ]),
        'question_20'   : new FormControl('' , [ Validators.required ]),
        'question_21'   : new FormControl('' , [ Validators.required ]),
        'question_22'   : new FormControl('' , [ Validators.required ]),
        'question_23'   : new FormControl('' , [ Validators.required ]),
        'question_24'   : new FormControl('' , [ Validators.required ]),
        'question_25'   : new FormControl('' , [ Validators.required ]),
        'remarks'       : new FormControl( '' , [ Validators.maxLength(400) ]),
        'height'        : new FormControl('' , [ Validators.required ]),
        'weight'        : new FormControl('' , [ Validators.required ])
    } );

    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        public translate        : TranslateService,
        public lang             : LanguageService,
        private userData        : UserService,
        private service         : PrgExaminersFraAService

    ) {
        translate.setDefaultLang(lang.defaultLang);
    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;
        
        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;

        //get examiner data
        this.service.getDataById(this.id).subscribe(
            data=>{
                this.examiner_id = data['data'].examiner_id;
                console.log(data['data'].examiner_id);
                // if ( data['status'] == 'success' ) {
                //     this.inputForm.patchValue({
                //         'company_code'    : data['data'].company_code,
                //         'company_name'    : data['data'].company_name,
                //         'address'         : data['data'].address,
                //         'zip'             : data['data'].zip,
                //         'telno'           : data['data'].telno,
                //         'faxno'           : data['data'].faxno,
                //         'email'           : data['data'].email,
                //         'cal_no'          : data['data'].cal_no,
                //         'remark'          : data['data'].remark
                //     });
                // } else {
                //     this.ServiceMessage.setError(data['message']);
                //     this.message = this.ServiceMessage.getMessage();
                // }
            },
            error=>{
                this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                this.message = this.ServiceMessage.getMessage();
            }
        );
    }

    onSubmit(){
        this.submitted = true;
        if ( this.inputForm.invalid ){
            return;
        }

        let inputData  : cInput = new cInput(this.inputForm.value);
        inputData.examiner_id   = this.examiner_id;

        // this.service.updateById( input_data ).subscribe(
        //     data => {
        //         if (data['status']== 'success'){
        //             this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
        //             this.router.navigateByUrl('/health/examiners');
        //         } else {
        //             this.ServiceMessage.setError(data['message']);
        //             this.message = this.ServiceMessage.getMessage();
        //         }
        //     },
        //     error => {
        //         this.ServiceMessage.setError('บันทึกผิดพลาด');
        //         this.message = this.ServiceMessage.getMessage();
        //     }
        // );
    }

    onCalculateBMI() {
        let inputData  : cInput = new cInput(this.inputForm.value);
        if ( inputData.weight && inputData.height) {
            this.bmi = (inputData.weight / Math.pow((inputData.height/100), 2)).toFixed(2);

            
        }
    }
}

