import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, CompanyService } from '../../../service/company.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector    : 'app-company-edit',
    templateUrl : './company-edit.component.html',
    styleUrls   : ['./company-edit.component.css']
})
export class CompanyEditComponent implements OnInit {

    public message    : MessageClass[] = [];

    public calendar_datas : any;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public id      : string;
    
    inputForm = new FormGroup({
        'company_code'        : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'company_name'        : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'address'            : new FormControl(''),
        'zip'                 : new FormControl(''),
        'telno'               : new FormControl(''),
        'faxno'               : new FormControl(''),
        'email'               : new FormControl(''),
        'cal_no'              : new FormControl(-1),
        'remark'              : new FormControl('', [ Validators.maxLength(200) ])
    });
    
    constructor(
        private param           : ActivatedRoute,
        private Service         : CompanyService,
        private ServiceMessage  : MessageService,
        private router          : Router
    ) { }

    ngOnInit() {
        window.scroll(0,0);
        this.id   = this.param.snapshot.params.id;

        this.Service.getCalendar().subscribe(
            data => {
                this.calendar_datas = data['data'];
            }
        );

      if ( this.id != '-1' ) {
            //get data from database
            this.Service.getDataById(this.id).subscribe(
                data=>{
                    if ( data['status'] == 'success' ) {
                        this.inputForm.patchValue({
                            'company_code'    : data['data'].company_code,
                            'company_name'    : data['data'].company_name,
                            'address'          : data['data'].address,
                            'zip'             : data['data'].zip,
                            'telno'           : data['data'].telno,
                            'faxno'           : data['data'].faxno,
                            'email'           : data['data'].email,
                            'cal_no'          : data['data'].cal_no,
                            'remark'          : data['data'].remark
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
    }

    onSubmit() {

        if ( this.inputForm.invalid ) {
            return;
        }

        let input_data	: cInput = new cInput(this.inputForm.value);
        input_data.id	= this.id;
        this.Service.updateById(input_data).subscribe(
            data => {
                if ( data['status'] == 'success' ) {
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                    this.router.navigateByUrl('/company/list');
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

