import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserService } from '../../service/user.service';

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
    public id                : string;
    public old_examiner_id  : number;

    inputForm = new FormGroup( {
        'unit_code'     : new FormControl( '' , [ Validators.required, Validators.maxLength(10) ]),
        'unit_name'     : new FormControl( '' , [ Validators.required, Validators.maxLength(50) ]),
        'remark'        : new FormControl( '' , [ Validators.maxLength(200) ])
    } );

    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router,
        private userData        : UserService

        // private Service         : UnitService,
    ) { }

    ngOnInit(): void {
        this.userData.main_menu_selected = 8;
        this.userData.sub_menu_selected  = 39;
        
        window.scroll(0,0);

        this.old_examiner_id    = this.param.snapshot.params.examiner_id;


        if ( this.old_examiner_id != -1 ) {
            //get data from database
            // this.Service.getDataById( this.old_unit_code ).subscribe(
            //     data => {

            //         if ( data['status'] == 'success' ) {

            //             this.inputForm.patchValue( {
            //                 'unit_code'   : data['data'].unit_code,
            //                 'unit_name'   : data['data'].unit_name,
            //                 'remark'          : data['data'].remark
            //             });
            //         } else {
            //             this.ServiceMessage.setError(data['message']);
            //             this.message = this.ServiceMessage.getMessage();
            //         }
            //     },
            //     error => {
            //         this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
            //         this.message = this.ServiceMessage.getMessage();
            //     }
            // );
        }

    }

    onSubmit(){
        this.submitted = true;
        if ( this.inputForm.invalid ){
            return;
        }

        // let input_data  : cInput = new cInput(this.inputForm.value);
        // input_data.old_unit_code = this.old_unit_code;

        // this.Service.updateById( input_data ).subscribe(
        //     data => {
        //         if (data['status']== 'success'){
        //             this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
        //             this.router.navigateByUrl('/master/unit');
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

}
