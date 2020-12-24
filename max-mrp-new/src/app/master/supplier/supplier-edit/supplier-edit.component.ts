import { Component, ElementRef, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { ComboData } from '../../../service/combo.service';
import { LoadingService } from '../../../service/loading.service';
import { UploadService } from '../../../service/upload.service';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { tap, finalize,map } from 'rxjs/operators';

//Please update below
import { cInput, SupplierService } from '../../../service/supplier.service';

@Component({
  selector: 'app-supplier-edit',
  templateUrl: './supplier-edit.component.html',
  styleUrls: ['./supplier-edit.component.css']
})
export class SupplierEditComponent implements OnInit {

    public message:       MessageClass[] = [];
    public comboType:     string         = "unit";
    public selected_file: File           = null;
    public unitCode$ :    Observable<string>;
    public itemImage :    ElementRef;
    public imgURL :       any;

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    old_supplier_code  : string;
    
    inputForm = new FormGroup({
        'supplier_code'     : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'supplier_name'     : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
        'address'           : new FormControl(''),
        'post_code'         : new FormControl('', [Validators.maxLength(10) ]),
        'tel_no'            : new FormControl('', [Validators.maxLength(50) ]),
        'fax_no'            : new FormControl('', [Validators.maxLength(50) ]),
        'e_mail'            : new FormControl('', [Validators.maxLength(100) ]),
        'contact'           : new FormControl('', [Validators.maxLength(100) ]),
        'delivery_time'     : new FormControl(0),
        'tax_id'            : new FormControl('', [Validators.maxLength(20) ]),
        'payment_tearm'     : new FormControl('', [Validators.maxLength(200) ]),
        'remark'            : new FormControl('', [Validators.maxLength(200) ]),

    });

    constructor(
        private param: ActivatedRoute,
        private Service: SupplierService,
        private ServiceMessage: MessageService,
        private router: Router,
        private loading: LoadingService,
        private userData        : UserService ,
        private upload: UploadService
    ) { 

    }

    ngOnInit() {
        window.scroll(0,0);

        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 48;
        
        this.old_supplier_code    = this.param.snapshot.params.supplier_code;
        console.log(this.old_supplier_code);
        if ( this.old_supplier_code != '-1' ) {
            //get data from database
            this.Service.getDataById( this.old_supplier_code )
            .pipe(
                tap( () => { this.loading.show(); } ) ,
                finalize( () => {
                    this.loading.hide();
                }),
                map( data => {
                    if ( data['status'] == 'success' ){
                        this.inputForm.patchValue({
                            'supplier_code'     : data['data'].supplier_code,
                            'supplier_name'     : data['data'].supplier_name,
                            'address'           : data['data'].address,
                            'post_code'         : data['data'].post_code,
                            'tel_no'            : data['data'].tel_no,
                            'fax_no'            : data['data'].fax_no,
                            'e_mail'            : data['data'].e_mail,
                            'contact'           : data['data'].contact,
                            'delivery_time'     : data['data'].delivery_time,
                            'tax_id'            : data['data'].tax_id,
                            'payment_tearm'     : data['data'].payment_tearm,
                            'remark'            : data['data'].remark

                        });
                    } else {
                        this.ServiceMessage.setError( data['message'] );
                        this.message = this.ServiceMessage.getMessage();
                    }
                })
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

        let input_data	: cInput = new cInput(this.inputForm.value);
        input_data.old_supplier_code = this.old_supplier_code;

        this.Service.updateById(input_data)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(data=>{

            if (data['status']== 'success'){
                this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
                this.router.navigateByUrl('/master/item');
                    } else {
                this.ServiceMessage.setError(data['message']);
                this.message = this.ServiceMessage.getMessage();
            }

        },
        error=>{
            this.ServiceMessage.setError('บันทึกผิดพลาด');
            this.message = this.ServiceMessage.getMessage();
        });
     
    }

}
