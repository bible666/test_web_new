import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { ComboData } from '../../../service/combo.service';
import { UserService } from '../../../service/user.service';

//Manual add service for this page
import { PrgExaminersFraAService } from '../../../service/prgExaminersFraA.service';

//import { cInput, UnitService } from '../../service/unit.service';

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
    public genderType   : string         = "gender";
    public genderCode$  : Observable<string>;
    public id           : number;
    public examiner_id  : number;

    inputForm = new FormGroup( {
        'exam_date'     : new FormControl('2021-03-29'),
        'question_1'    : new FormControl(false),
        'question_2'    : new FormControl(false),
        'question_3'    : new FormControl(false),
        'question_4'    : new FormControl(false),
        'question_5'    : new FormControl(false),
        'question_6'    : new FormControl(false),
        'question_7'    : new FormControl(false),
        'question_8'    : new FormControl(false),
        'question_9'    : new FormControl(false),
        'question_10'   : new FormControl(false),
        'question_11'   : new FormControl(false),
        'question_12'   : new FormControl(false),
        'question_13'   : new FormControl(false),
        'question_14'   : new FormControl(false),
        'question_15'   : new FormControl(false),
        'question_16'   : new FormControl(false),
        'question_17'   : new FormControl(false),
        'question_18'   : new FormControl(false),
        'question_19'   : new FormControl(false),
        'question_20'   : new FormControl(false),
        'question_21'   : new FormControl(false),
        'question_22'   : new FormControl(false),
        'question_23'   : new FormControl(false),
        'question_24'   : new FormControl(false),
        'question_25'   : new FormControl(false),
        'remarks'       : new FormControl( '' , [ Validators.maxLength(400) ])
    } );

    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService,
        private service         : PrgExaminersFraAService

        // private Service         : UnitService,
    ) {
        
    }

    ngOnInit(): void {
        this.userData.main_menu_selected = 50;
        this.userData.sub_menu_selected  = 51;
        
        window.scroll(0,0);

        this.id    = this.param.snapshot.params.test_id;

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
        if ( this.examiner_id != -1 ) {
            //get data from database
            this.service.getDataById( this.examiner_id ).subscribe(
                data => {
                    if ( data['status'] == 'success' ) {
                        //this.inputForm.patchValue( {
                        //    'examiner_code'  : data['data'].examiner_code,
                        //    'first_name'     : data['data'].first_name,
                        //    'last_name'      : data['data'].last_name,
                        //    'birthdate'      : data['data'].birthdate
                        //});
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

        // let input_data  : cInput = new cInput(this.inputForm.value);
        // input_data.id = this.examiner_id;

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

    onGenderSelect( data: ComboData ){
        this.inputForm.patchValue({
            'gender'             : data.value_code
        });
    }

}

