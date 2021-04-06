import { Component, ElementRef, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, ItemService } from '../../../service/item.service';
import { ComboData } from '../../../service/combo.service';
import { LoadingService } from '../../../service/loading.service';
import { UploadService } from '../../../service/upload.service';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { tap, finalize,map } from 'rxjs/operators';

@Component({
    selector: 'app-item-edit',
    templateUrl: './item-edit.component.html',
    styleUrls: ['./item-edit.component.css']
})
export class ItemEditComponent implements OnInit {

    public message:       MessageClass[] = [];
    public comboType:     string         = "unit";
    public selected_file: File           = null;
    public unitCode$ :    Observable<string>;
    public itemImage :    ElementRef;
    public imgURL :       any;

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
        'image_file'            : new FormControl('')
    });
  
    constructor(
        private param: ActivatedRoute,
        private Service: ItemService,
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
        this.userData.sub_menu_selected  = 43;
        
        this.old_item_code    = this.param.snapshot.params.item_code;

        if ( this.old_item_code != '-1' ) {
            //get data from database
            this.Service.getDataById( this.old_item_code )
            .pipe(
                tap( () => { this.loading.show(); } ) ,
                finalize( () => {
                    this.loading.hide();
                }),
                map( data => {
                    if ( data['status'] == 'success' ){
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
                            'remark'                : data['data'].remark,
                            'image_file'            : data['data'].image_file
                        });
                        this.unitCode$ = data['data'].unit_code;
                        this.imgURL = 'http://localhost/test_web_new/API/public/ItemController/img/'+data['data'].item_code;
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

    //onUnitSelect( data: ComboData ){
    //    this.inputForm.patchValue({
    //        'unit_code'             : data.value_code
    //    });
    //}

    onSubmit(){

        if ( this.inputForm.invalid ) {
            return;
        }

        let input_data	: cInput = new cInput(this.inputForm.value);
        input_data.old_item_code = this.old_item_code;

        //upload image
        const fd = new FormData();
        fd.append('file',this.selected_file);
        fd.append('feature','item');
        this.upload.upload( fd )
        .pipe(
            tap( ()      => { this.loading.show(); } ),
            finalize( () => { this.loading.hide(); } )
        )
        .subscribe( data => {
            if ( data['status'] == 'success' ) {
                if ( data['file_name'] !== '' ) {
                    input_data.image_file = data['file_name'];
                }
                
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
            } else {
                alert( 'upload image error' );
            }
            
            console.log(input_data);
        },
        error => {
            console.log(error);
        });
    }

    onFileSelected( event , file ) {
        this.selected_file = <File>event.target.files[0];

        var mimeType = this.selected_file.type;

        if ( mimeType.match(/image\/*/) == null ) {
            alert( "Only images are supported." );
            file.value         = null;
            this.selected_file = null;
            this.imgURL        = null;
            return;
        }

        //check image width
        var render = new FileReader();
        render.readAsDataURL( this.selected_file );
        render.onload = ( _event ) => {
            let img = new Image();
            img.onload = () => {
                if ( img.width > 300 || img.height > 300 ) {
                    alert("image size is 300 x 300");
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

    }

}
