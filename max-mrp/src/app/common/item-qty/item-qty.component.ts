import { Component, OnInit ,Inject }                from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA}             from '@angular/material/dialog';
import { FormControl, FormGroup, Validators, ValidatorFn, ValidationErrors }       from '@angular/forms';
import { LoadingService }                           from '../../service/loading.service';
import { TransferService }                          from '../../service/transfer.service';
import { ItemService }                              from '../../service/item.service';
import {switchMap,debounceTime, tap, finalize,map}  from 'rxjs/operators';

export interface DialogData {
    location_code:      string;
    item_code:          string;
    lot_no:             string;
    first_receive_date: Date;
    quantity:           number;
}

export interface cItem {
    item_code: string;
    item_name: string;
}


@Component({
    selector: 'app-item-qty',
    templateUrl: './item-qty.component.html',
    styleUrls: ['./item-qty.component.css']
})
export class ItemQtyComponent implements OnInit {

    isLoading = false;

    location_code   : string    = '';
    oldQty          : number    = 0;

    filteredItem:     cItem[] = [];
    AR_lot_no:        any[]   = [];
    AR_receive_date:  any[]   = [];


    inputForm = new FormGroup({
        'item_code'            : new FormControl(this.data.item_code, [ Validators.required ]),
        'item_name'            : new FormControl(''),
        'lot_no'               : new FormControl(this.data.lot_no, [ Validators.required ]),
        'first_receive_date'   : new FormControl(this.data.first_receive_date, [ Validators.required ]),
        'quantity'             : new FormControl(0, [ Validators.required ]),
        'unit_name'            : new FormControl(''),
    }, {
        validators: [this.checkInput()],
        updateOn: 'blur',
    } );

    constructor(
        public dialogRef: MatDialogRef<ItemQtyComponent>,
        private Service: TransferService,
        private loading: LoadingService,
        private service_item : ItemService,
        @Inject(MAT_DIALOG_DATA) public data: DialogData)
    {

    }

    public checkInput(): ValidatorFn {
        return (formGroup: FormGroup) => {

            const qty: number = +formGroup.get("quantity").value;

            if ( qty > this.oldQty ){
                return { checkInput: true };
            }
            
            return null;
        };
    }

    onSave(){
        if (this.inputForm.valid){
            //get Item_data
            this.service_item.getDataById(this.inputForm.get("item_code").value)
            .pipe(
                tap(()=>{
                    this.loading.show();
                }),
                finalize(()=>{
                    this.loading.hide();
                })
            )
            .subscribe(data=>{
                if (data['status']== 'success'){
                    this.inputForm.patchValue({
                        'item_name'   : data['data']['item_name'],
                        'unit_name'   : data['data']['unit_name'],
                      });
                }
                this.dialogRef.close(this.inputForm.value);
            });

        }

    }

    ngOnInit() {
        this.location_code = this.data.location_code;
        this.service_item.getItemListByLocation(this.data.location_code,'')
        .pipe(
            tap(()         =>{this.loading.show();}),
            finalize(()    =>{this.loading.hide();})
        )
        .subscribe(data=>{
            if (data['status']== 'success'){
                this.filteredItem   = data['data'];
            } 
        },
        error=>{
            //this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
            //this.message = this.ServiceMessage.getMessage();
            console.log(error.message);
        });

    }

    onItemKeyUp(itemEvent:any){
        let itemName: string = itemEvent.target.value;
        this.service_item.getItemListByLocation(this.data.location_code,itemName)
        .pipe(
            tap(()=>{
                this.loading.show();
            }),
            finalize(()=>{
                this.loading.hide();
            })
        )
        .subscribe(unit => {
            this.filteredItem = unit['data'];
        });
    }

    onNoClick(): void {
        this.dialogRef.close();
    }

    //Function for Auto complete
    displayFn(value:string){
        if (value && this.filteredItem.length > 0 ) 
        {
            return this.filteredItem.find(x => x.item_code == value).item_name;
        } else {
            return '';
        }
    }

    //Function when move out Auto Complete
    onBlurItemCode(){

        //Clear Old lot, qty and receive date
        this.inputForm.patchValue({
            'first_receive_date'    : '',
            'lot_no'                : '',
            'quantity'              : 0,
        });
        this.oldQty                    = 0;
        //check item code is exist or not
        let new_item_code       : string    = '';
        let old_item_code       : string    = this.inputForm.get("item_code").value;

        this.service_item.getItemListByLocation(this.data.location_code,old_item_code)
        .pipe(
            tap(()=>{
                this.loading.show();
            }),
            finalize(()=>{
                this.loading.hide();
            })
        )
        .subscribe(data=>{
            if (data['status']== 'success'){
                if ( data['data'].length >= 1 ) {
                    new_item_code = data['data'][0]['item_code'];
                }
            }

            if (old_item_code != new_item_code){
                this.inputForm.patchValue({
                    'item_code'     : new_item_code
                });
            }

            // get lot no from db.
            let item_code: string = this.inputForm.get("item_code").value;
            //clear select lot no
            this.inputForm.patchValue({
                'lot_no'    : ''
            });

            if ( !item_code ) {
                this.AR_lot_no = [];
            } else {
                this.Service.getLotNo(this.location_code,item_code)
                .pipe(
                    tap(()      =>{this.loading.show();}),
                    finalize(() =>{this.loading.hide();})
                )
                .subscribe(data=>{
                    if (data['status']== 'success'){
                        this.AR_lot_no = data['data'];
                    } 
                });
            }
        });

    }

    onLotNoChange(event:any){
        let item_code:      string = this.inputForm.get("item_code").value;
        let lot_no:         string = event.target.value;

        //clear receive date
        this.AR_receive_date = [];
        this.inputForm.patchValue({
            'first_receive_date'    : ''
        });
      
        this.service_item.getReceiveDate( this.data.location_code , item_code , lot_no )
            .pipe(
                tap(()=>{
                    this.loading.show();
                }),
                finalize(()=>{
                    this.loading.hide();
                })
            )
            .subscribe(data=>{

                if (data['status']== 'success'){
                    this.AR_receive_date = data['data'];
                }

            });
    }

    convertStringToNumber(myString:string){
        return +myString;
    }

    onReceiveDateChange(event){
        let selectQty:number = 0;
        this.AR_receive_date.forEach(function (value) {
            if ( value['first_receive_date'] == event.target.value ) {
                selectQty = +value['quantity'];
            }
        });
        this.oldQty = selectQty;
    }
}
