import { Component, ElementRef, OnInit } from '@angular/core';
import { FormControl, FormControlDirective, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, ItemService } from '../../../service/item.service';
import { ComboService } from '../../../service/combo.service';
import { LoadingService } from '../../../service/loading.service';
import { UploadService } from '../../../service/upload.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';
import { renderFlagCheckIfStmt } from '@angular/compiler/src/render3/view/template';

export interface User {
    name: string;
    value: string;
}

export interface Unit {
    unit_code: string;
    unit_name: string;
}

@Component({
    selector: 'app-item-edit',
    templateUrl: './item-edit.component.html',
    styleUrls: ['./item-edit.component.css']
})
export class ItemEditComponent implements OnInit {

    public message: MessageClass[] = [];
    submitted: boolean = false;

    show_unit_name :string = 'DDD';

    comboType: string = "unit";

    selected_file: File = null;

    options: User[] = [
        {name: 'Mary', value: 'Mary'},
        {name: 'Shelley', value: 'l'},
        {name: 'Igor', value : 'i'}
    ];

    isLoading = false;

    itemImage : ElementRef;

    imgURL : any;

    filteredOptions: Observable<User[]>;
    filteredUnit: Unit[] = [];

    //----------------------------------------------------------------
    // set local Valiable
    //----------------------------------------------------------------
    old_item_code  : string;
    
    inputForm = new FormGroup({
        'item_code'             : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'item_name'             : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'item_type'             : new FormControl(''),
        'lot_flag'              : new FormControl(true),
        'unit_code'             : new FormControl(''),
        'standard_location'     : new FormControl(''),
        'production_lead_time'  : new FormControl(0),
        'request_decimal'       : new FormControl(0),
        'mrp_flag'              : new FormControl(false),
        'remark'                : new FormControl('', [ Validators.maxLength(200) ]),
        'file'                  : new FormControl('')
    });
  
    constructor(
        private param: ActivatedRoute,
        private Service: ItemService,
        private ServiceMessage: MessageService,
        private router: Router,
        private loading: LoadingService,
        private upload: UploadService,
        private comboService: ComboService
    ) { 

    }

    ngOnInit() {
        window.scroll(0,0);
        
        this.old_item_code    = this.param.snapshot.params.item_code;



        if (this.old_item_code != '-1') {
            //get data from database
            
            this.Service.getDataById(this.old_item_code)
            .pipe(
                tap(()=>{this.loading.show();}),
                finalize(()=>{this.loading.hide();})
            )
            .subscribe(data=>{
                
                if (data['status']== 'success'){
                
                let isDefault = true;
                
                this.inputForm.patchValue({
                    'item_code'             : data['data'].item_code,
                    'item_name'             : data['data'].item_name,
                    'item_type'             : data['data'].item_type,
                    'lot_flag'              : data['data'].lot_flag == 1 ?true:false,
                    'unit_code'             : data['data'].unit_code,
                    'standard_location'     : data['data'].standard_location,
                    'production_lead_time'  : data['data'].production_lead_time,
                    'request_decimal'       : data['data'].request_decimal,
                    'mrp_flag'              : data['data'].mrp_flag == 1 ? true:false,
                    'remark'                : data['data'].remark
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

    onBlurUnitCode(){
        let unit_code:string = '';
        let old_unit_code:string = this.inputForm.get("unit_code").value;
        this.Service.getUnitCode(old_unit_code)
        .pipe(
        tap(()=>{this.loading.show();}),
        finalize(()=>{this.loading.hide();})
        )
        .subscribe(data=>{
        if (data['status']== 'success'){
            unit_code = data['data'];
        } 
        
        if (old_unit_code != unit_code){
            this.inputForm.patchValue({
            'unit_code'             : unit_code
            });
        }
        });
    }

    displayFn(value:string){
        if (value && this.filteredUnit.length > 0 ) {
            return this.filteredUnit.find(x => x.unit_code == value).unit_name;
        } else {
            return '';
        }
    }

    onSubmit(){
        this.submitted = true;
        if ( this.inputForm.invalid ) {
            return;
        }

        // let input_data	: cInput = new cInput(this.inputForm.value);
        // input_data.old_item_code = this.old_item_code;

        // this.Service.updateById(input_data)
        // .pipe(
        //     tap(()=>{this.loading.show();}),s
        //     finalize(()=>{this.loading.hide();})
        // )
        // .subscribe(data=>{

        //     if (data['status']== 'success'){
        //         this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
                
        //         this.router.navigateByUrl('/master/item');
        //             } else {
        //         this.ServiceMessage.setError(data['message']);
        //         this.message = this.ServiceMessage.getMessage();
        //     }

        // },
        // error=>{
        //     this.ServiceMessage.setError('บันทึกผิดพลาด');
        //     this.message = this.ServiceMessage.getMessage();
        // });
    }

    onFileSelected(event,file) {
        this.selected_file = <File>event.target.files[0];

        var mimeType = this.selected_file.type;

        if (mimeType.match(/image\/*/) == null) {
            alert("Only images are supported.");
            file.value= null;
            this.selected_file = null;
            this.imgURL = null;
            return;
        }

        //check image width
        var render = new FileReader();
        render.readAsDataURL(this.selected_file);
        render.onload = (_event) => {
            let img = new Image();
            img.onload = () => {
                if ( img.width > 200 || img.height > 200 ) {
                    alert("image size is 200 x 200");
                    file.value= null;
                    this.selected_file = null;
                    this.imgURL = null;
                    return;
                } else {

                }
            }
            
            this.imgURL = render.result;
            img.src = this.imgURL;
        }

        //const fd = new FormData();
        //fd.append('file',this.selected_file);
        //fd.append('feature','item');
        //this.upload.upload(fd).subscribe(data=>{
        //    console.log(data);
        //},
        //error=>{
        //    console.log(error);
        //});

    }

}
