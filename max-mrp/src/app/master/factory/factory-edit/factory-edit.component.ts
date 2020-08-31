import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, FactoryService } from '../../../service/factory.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component( {
    selector    : 'app-factory-edit',
    templateUrl : './factory-edit.component.html',
    styleUrls   : ['./factory-edit.component.css']
} )
export class FactoryEditComponent implements OnInit {

    public message    : MessageClass[] = [];
    public submitted  : boolean = false;

    public calendar_datas : any;
    public company_datas  : any;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    id               : string;
    old_company_code : string;
    old_factory_code : string;
    
    inputForm = new FormGroup( {
        'company_code'        : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'factory_code'        : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'factory_name'        : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'address'             : new FormControl('', [ Validators.maxLength(200)]),
        'telno'               : new FormControl('', [ Validators.maxLength(50)]),
        'faxno'               : new FormControl('', [ Validators.maxLength(50)]),
        'email'               : new FormControl('', [ Validators.maxLength(100)]),
        'cal_no'              : new FormControl(-1),
        'remark'              : new FormControl('', [ Validators.maxLength(200) ])
    } );
    
    constructor(
        private param           : ActivatedRoute,
        private Service         : FactoryService,
        private ServiceMessage  : MessageService,
        private router          : Router
    ) { }

    ngOnInit() {
        window.scroll(0,0);
        this.old_company_code   = this.param.snapshot.params.company_code;
        this.old_factory_code   = this.param.snapshot.params.factory_code;

        this.Service.getCalendar().subscribe(
            data => {
                this.calendar_datas = data['data'];
            }
        );

        this.Service.getCompany().subscribe(
            data => {
                this.company_datas = data['data'];
            }
        );

        if ( this.old_company_code != '-1' ) {
            //get data from database
            this.Service.getDataById(this.old_company_code,this.old_factory_code).subscribe(
                data=>{

                    if ( data['status'] == 'success' ) {
                
                        this.inputForm.patchValue( {
                            'company_code'    : data['data'].company_code,
                            'factory_code'    : data['data'].factory_code,
                            'factory_name'    : data['data'].factory_name,
                            'address'         : data['data'].address,
                            'telno'           : data['data'].telno,
                            'faxno'           : data['data'].faxno,
                            'email'           : data['data'].email,
                            'cal_no'          : data['data'].cal_no,
                            'remark'          : data['data'].remark
                        } );
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
    }

    onSubmit() {
        this.submitted = true;
        if (this.inputForm.invalid) {
            return;
        }

        let input_data    : cInput = new cInput(this.inputForm.value);
        input_data.old_company    = this.old_company_code;
        input_data.old_factory    = this.old_factory_code;

        this.Service.updateById(input_data).subscribe(
            data => {
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');

                    this.router.navigateByUrl('/factory/list');
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

