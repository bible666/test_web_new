import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, LocationService } from '../../../service/location.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component( {
    selector    : 'app-location-edit',
    templateUrl : './location-edit.component.html',
    styleUrls   : ['./location-edit.component.css']
} )
export class LocationEditComponent implements OnInit {

    public message      : MessageClass[] = [];
    public submitted    : boolean = false;

    public factory_datas : any;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    public id                : string;
    public old_factory_code  : string;
    public old_location_code : string;
    
    inputForm = new FormGroup( {
        'factory_code'        : new FormControl( '' , [ Validators.required, Validators.maxLength(10) ]),
        'location_code'       : new FormControl( '' , [ Validators.required, Validators.maxLength(10) ]),
        'location_name'       : new FormControl( '' , [ Validators.required, Validators.maxLength(50) ]),
        'mrp_flag'            : new FormControl( false ),
        'expire_flag'         : new FormControl( false ),
        'remark'              : new FormControl( '' , [ Validators.maxLength(200) ])
    } );
    
    constructor(
        private param           : ActivatedRoute,
        private Service         : LocationService,
        private ServiceMessage  : MessageService,
        private router          : Router
    ) { }

    ngOnInit() {
        window.scroll(0,0);

        this.old_factory_code     = this.param.snapshot.params.factory_code;
        this.old_location_code    = this.param.snapshot.params.location_code;


        this.Service.getFactory().subscribe(
            data => {
                this.factory_datas = data['data'];
            }
        );

        if ( this.old_location_code != '-1' ) {
            //get data from database
            this.Service.getDataById( this.old_factory_code , this.old_location_code ).subscribe(
                data => {

                    if ( data['status'] == 'success' ) {

                        this.inputForm.patchValue( {
                            'factory_code'    : data['data'].factory_code,
                            'location_code'   : data['data'].location_code,
                            'location_name'   : data['data'].location_name,
                            'mrp_flag'        : data['data'].mrp_flag,
                            'expire_flag'     : data['data'].expire_flag,
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
        input_data.old_factory  = this.old_factory_code;
        input_data.old_location = this.old_location_code;

        this.Service.updateById( input_data ).subscribe(
            data => {
                if (data['status']== 'success'){
                    this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
                    this.router.navigateByUrl('/location/list');
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


