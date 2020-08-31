import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, CustomerService } from '../../../service/customer.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class CustomerEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  //----------------------------------------------------------------
  // set local Valiable
  //----------------------------------------------------------------
  old_customer_code  : string;

  
  inputForm = new FormGroup({
    'customer_code'   : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
    'customer_name'   : new FormControl('', [ Validators.required, Validators.maxLength(200) ]),
    'address'         : new FormControl('', [ Validators.maxLength(200) ]),
    'post_code'       : new FormControl('', [ Validators.maxLength(10) ]),
    'tel_no'          : new FormControl('', [ Validators.maxLength(50) ]),
    'fax_no'          : new FormControl('', [ Validators.maxLength(50) ]),
    'e_mail'          : new FormControl('', [ Validators.maxLength(100),Validators.email ]),
    'contact'         : new FormControl('', [ Validators.maxLength(100) ]),
    'delivery_time'   : new FormControl('', [ Validators.max(999)]),
    'tax_id'          : new FormControl('', [ Validators.maxLength(20) ]),
    'payment_tearm'   : new FormControl('', [ Validators.maxLength(200) ]),
    'remark'          : new FormControl('', [ Validators.maxLength(200) ])

  });
  
  constructor(private param: ActivatedRoute,
    private Service: CustomerService,
    private ServiceMessage: MessageService,
    private router: Router) { }

  ngOnInit() {
    window.scroll(0,0);

    this.old_customer_code    = this.param.snapshot.params.customer_code;



    if (this.old_customer_code != '-1') {
      //get data from database
      this.Service.getDataById(this.old_customer_code)
      .subscribe(data=>{
        
        if (data['status']== 'success'){
          
          let isDefault = true;
          
          this.inputForm.patchValue({
            'customer_code'   : data['data'].customer_code,
            'customer_name'   : data['data'].customer_name,
            'address'         : data['data'].address,
            'post_code'       : data['data'].post_code,
            'tel_no'          : data['data'].tel_no,
            'fax_no'          : data['data'].fax_no,
            'e_mail'          : data['data'].e_mail,
            'contact'         : data['data'].contact,
            'delivery_time'   : data['data'].delivery_time,
            'tax_id'          : data['data'].tax_id,
            'payment_tearm'   : data['data'].payment_tearm,
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
        });
      }
  }

  onSubmit(){
    this.submitted = true;
    if (this.inputForm.invalid){
      return;
    }

    let input_data	: cInput = new cInput(this.inputForm.value);
    input_data.old_customer_code  = this.old_customer_code;

    this.Service.updateById(input_data)
    .subscribe(data=>{

      if (data['status']== 'success'){
        this.ServiceMessage.setSuccess('บันทึกสำเร็จ');

        this.router.navigateByUrl('/system/customer/list');
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

  keyPress(event: KeyboardEvent) {
    const pattern = /[0-9]/;
    
    if (!pattern.test(event.key)) {    
        // invalid character, prevent input
        event.preventDefault();
    }
  }

}




