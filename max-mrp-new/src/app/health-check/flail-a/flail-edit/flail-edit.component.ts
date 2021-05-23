import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { UserService } from '../../../service/user.service';
import { TranslateService } from '@ngx-translate/core';
import { LanguageService } from '../../../service/language.service';
import { PrimeNGConfig } from 'primeng/api';

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

    inputForm = new FormGroup( {
        'examiner_id'   : new FormControl(''),
        'exam_date'     : new FormControl(new Date(), [ Validators.required ]),
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
        'question_12'   : new FormControl(''),
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
        'height'        : new FormControl(0 , [ Validators.required ]),
        'weight'        : new FormControl('' , [ Validators.required ])
    } );

    constructor(
        public translateService : TranslateService,
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        public config           : PrimeNGConfig,
        private router          : Router,
        public lang             : LanguageService,
        private userData        : UserService,
        private service         : PrgExaminersFraAService

    ) {

    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;
        
        window.scroll(0,0);

        this.examiner_id    = this.param.snapshot.params.examiner_id;
        this.id             = this.param.snapshot.params.id;

        this.translateService.setDefaultLang(this.lang.defaultLang);
        this.translate(this.lang.defaultLang);
        //get examiner data
        this.service.getDataById(this.id).subscribe(
            data=>{
                this.examiner_id = data['data'].examiner_id;
                if ( data['status'] == 'success' ) {
                    this.inputForm.patchValue({
                        'examiner_id'   : data['data'].examiner_id,
                        'exam_date'     : new Date(data['data'].exam_date),
                        'question_1'    : data['data'].question_1,
                        'question_2'    : data['data'].question_2,
                        'question_3'    : data['data'].question_3,
                        'question_4'    : data['data'].question_4,
                        'question_5'    : data['data'].question_5,
                        'question_6'    : data['data'].question_6,
                        'question_7'    : data['data'].question_7,
                        'question_8'    : data['data'].question_8,
                        'question_9'    : data['data'].question_9,
                        'question_10'   : data['data'].question_10,
                        'question_11'   : data['data'].question_11,
                        'question_12'   : data['data'].question_12,
                        'question_13'   : data['data'].question_13,
                        'question_14'   : data['data'].question_14,
                        'question_15'   : data['data'].question_15,
                        'question_16'   : data['data'].question_16,
                        'question_17'   : data['data'].question_17,
                        'question_18'   : data['data'].question_18,
                        'question_19'   : data['data'].question_19,
                        'question_20'   : data['data'].question_20,
                        'question_21'   : data['data'].question_21,
                        'question_22'   : data['data'].question_22,
                        'question_23'   : data['data'].question_23,
                        'question_24'   : data['data'].question_24,
                        'question_25'   : data['data'].question_25,
                        'remarks'       : data['data'].remarks,
                        'height'        : data['data'].height,
                        'weight'        : data['data'].weight
                    });
                } else {
                    this.ServiceMessage.setError(data['message']);
                    this.message = this.ServiceMessage.getMessage();
                }
            },
            error=>{
                this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                this.message = this.ServiceMessage.getMessage();
            }
        );
    }

    translate(lang: string) {
        this.translateService.use(lang);
        this.translateService.get('primeng').subscribe(res => this.config.setTranslation(res));
    }

    onSubmit(){
        this.submitted = true;
        if ( this.inputForm.invalid ){
            return;
        }

        let inputData  : cInput = new cInput(this.inputForm.value);
        inputData.examiner_id   = this.examiner_id;
        inputData.id            = this.id;

        this.service.updateById( inputData ).subscribe(
            data => {
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
                    this.router.navigate(['/health/flail-a/index/',this.examiner_id]);
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

    onCalculateBMI() {
        let inputData  : cInput = new cInput(this.inputForm.value);
        if ( inputData.weight && inputData.height) {
            this.bmi = (inputData.weight / Math.pow((inputData.height/100), 2)).toFixed(2);

            
        }
    }
}

