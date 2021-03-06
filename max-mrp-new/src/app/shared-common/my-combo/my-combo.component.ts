import { Component, OnInit, Input, Inject, Output, EventEmitter, OnChanges, forwardRef } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormControl, FormGroup, ControlValueAccessor, NG_VALUE_ACCESSOR } from '@angular/forms';
import { ComboData, ComboService } from '../../service/combo.service';
import { tap, finalize } from 'rxjs/operators';
import { LoadingService } from '../../service/loading.service';
import { Observable } from 'rxjs';

@Component({
    selector: 'my-combo',
    templateUrl: './my-combo.component.html',
    styleUrls: ['./my-combo.component.css'],
    providers: [
        {
          provide: NG_VALUE_ACCESSOR,
          useExisting: forwardRef(() => MyComboComponent),
          multi: true
        }
    ]
})
export class MyComboComponent implements OnInit, OnChanges {

    @Input() comboType: string;
    @Input() width:     number = 20;

    comboDatas   : ComboData[];
    displayValue : string = "";
    widthText    : string = "30%";
    widthDis     : string = "60%";
    service_name : string = "";
    comboValue   : string = "";

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        public dialog: MatDialog
    ) {
        
    }

    onChange = (comboValue) => {};
    onTouched = () => { };

    writeValue(value: string): void {
        this.comboValue = value ? value : ''
        if ( this.comboValue ) {
            let searchValue: string = this.comboValue;
            this.service.getData(this.service_name,searchValue)
            .pipe(
                tap( ()      => { this.loading.show(); } ),
                finalize( () => { this.loading.hide(); } )
            )
            .subscribe(data =>{
                this.displayValue = "";
                let returnData : ComboData = new ComboData();
                if ( data['data'][0] ) {
                    this.displayValue       = data['data'][0].display_code;
                    returnData.display_code = data['data'][0].display_code;
                    returnData.value_code   = searchValue;
    
                    this.inputForm.patchValue({
                        'value_search'             : this.comboValue
                    });
                    this.onChange(this.comboValue);
                } else {
                    returnData.display_code = '';
                    returnData.value_code   = '';
                    this.onChange('');
                }
            });
        }
    }
    registerOnChange(fn: any): void {
        this.onChange = fn;
    }
    registerOnTouched(fn: any): void {
        this.onTouched = fn;
    }

    ngOnInit(): void {

        switch ( this.comboType ) {
            case "unit": {
                this.service_name = "get_unit";
                break;
            }
            case "title": {
                this.service_name = "get_title";
                break;
            }
            case "gender": {
                this.service_name = "get_gender";
                break;
            }
            case "department": {
                this.service_name = "get_department";
                break;
            }
            case "position": {
                this.service_name = "get_position";
                break;
            }
            
        }
        
        this.widthText = this.width + '%';
        this.widthDis  = ( 80 - this.width) + '%';

    }

    ngOnChanges(changes) {
        console.log(changes);
        // if ( changes.value.currentValue ) {
        //     let searchValue: string = changes.value.currentValue;
        //     this.service.getData(this.service_name,searchValue)
        //     .pipe(
        //         tap( ()      => { this.loading.show(); } ),
        //         finalize( () => { this.loading.hide(); } )
        //     )
        //     .subscribe(data =>{
        //         this.displayValue = "";
        //         let returnData : ComboData = new ComboData();
        //         if ( data['data'][0] ) {
        //             this.displayValue       = data['data'][0].display_code;
        //             returnData.display_code = data['data'][0].display_code;
        //             returnData.value_code   = searchValue;
    
        //             this.inputForm.patchValue({
        //                 'value_search'             : this.value
        //             });
        //             this.onChange(this.value);
        //             this.selectEvent.emit(returnData);
        //         } else {
        //             returnData.display_code = '';
        //             returnData.value_code   = '';
        //             this.onChange('');
        //             this.selectEvent.emit(returnData);
        //         }
        //     });
        // }
        
    }

    onBlur(value: string){
        let searchValue: string = this.inputForm.get("value_search").value;
        this.service.getData(this.service_name,searchValue)
        .pipe(
            tap( ()      => { this.loading.show(); } ),
            finalize( () => { this.loading.hide(); } )
        )
        .subscribe(data =>{
            this.displayValue = "";
            let returnData : ComboData = new ComboData();
            if ( data['data'][0] ) {
                this.displayValue = data['data'][0].display_code;
                returnData.display_code = data['data'][0].display_code;
                returnData.value_code   = searchValue;
                this.onChange(searchValue);
            } else {
                returnData.display_code = '';
                returnData.value_code   = '';
                this.onChange('');
            }

        });

    }

    onClick(){
        const dialogRef = this.dialog.open(DialogComboDialog, {
            width: '400px',
            data: this.comboType
        });
      
        dialogRef.afterClosed().subscribe(result => {
            let returnCode      : string = '';
            let returnDisplay   : string = '';

            if( result ) {
                let data : ComboData = result;
                returnCode      = data.value_code;
                returnDisplay   = data.display_code;
            }

            this.inputForm.patchValue({
                'value_search'             : returnCode
            });

            this.onChange(returnCode);
            this.displayValue = returnDisplay;

            let returnData : ComboData = new ComboData();
            returnData.display_code     = returnDisplay;
            returnData.value_code       = returnCode;

        });
        
    }

}


@Component({
    selector: 'dialog-combo-dialog',
    templateUrl: 'dialog-combo-dialog.html',
    styleUrls: ['dialog-combo-dialog.css']
})
export class DialogComboDialog implements OnInit {

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    public comboDatas      : ComboData[] = [];

    service_name           : string = "";

    selectedItem           : ComboData;

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        public dialogRef: MatDialogRef<DialogComboDialog>,
        @Inject(MAT_DIALOG_DATA) public comboType: string
    ) {
        this.service_name = "";

        switch ( this.comboType ) {
            case "unit": {
                this.service_name = "get_unit_list";
                break;
            }
            case "title": {
                this.service_name = "get_title_list";
                break;
            }
            case "gender": {
                this.service_name = "get_gender_list";
                break;
            }
            case "department": {
                this.service_name = "get_department_list";
                break;
            }
            case "position": {
                this.service_name = "get_position_list";
                break;
            }
            
        }

    }

    ngOnInit(): void {

        this.service.getData(this.service_name)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(unit =>{
            this.comboDatas = unit['data'];
        });

    }

    onSearch(): void {
        let searchValue: string = this.inputForm.get("value_search").value;
        this.service.getData(this.service_name,searchValue)
        .pipe(
            tap( ()      => { this.loading.show(); } ),
            finalize( () => { this.loading.hide(); } )
        )
        .subscribe(data =>{
            this.comboDatas = data['data'];

        });
    }

    onClick(selected:ComboData): void {
        this.selectedItem = selected;
    }

    onCloseClick(){
        this.dialogRef.close();
    }

    onSaveClick(){
        if ( this.selectedItem) {
            this.dialogRef.close(this.selectedItem);
        } else {
            this.dialogRef.close();
        }
    }
  
}