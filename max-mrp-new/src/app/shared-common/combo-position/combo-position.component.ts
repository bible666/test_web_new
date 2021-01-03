import { Component, OnInit, Input, Inject, Output, EventEmitter, OnChanges } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormControl, FormGroup } from '@angular/forms';
import { ComboData, ComboService } from '../../service/combo.service';
import { tap, finalize } from 'rxjs/operators';
import { LoadingService } from '../../service/loading.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'combo-position',
  templateUrl: './combo-position.component.html',
  styleUrls: ['./combo-position.component.css']
})
export class ComboPositionComponent implements OnInit {

    @Input() width:             number = 20;
    @Input() department_code:   Observable<string>;
    @Input() position_code:     Observable<string>;

    @Output() selectEvent = new EventEmitter<ComboData>();

    comboDatas   : ComboData[];
    displayValue : string = "";
    widthText    : string = "30%";
    widthDis     : string = "60%";
    _department_code : string = "";

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        public dialog: MatDialog
    ) { }

    ngOnInit(): void {
        this.widthText = this.width + '%';
        this.widthDis  = ( 80 - this.width) + '%';
        this.department_code.subscribe( data=> {
            this._department_code = data;
        });
    }

    ngOnChanges(changes) {
        if ( changes.value.currentValue ) {

            this.service.getPosition(this._department_code,changes)
            .pipe(
                tap( ()      => { this.loading.show(); } ),
                finalize( () => { this.loading.hide(); } )
            )
            .subscribe(data =>{
                this.displayValue = "";
            //     let returnData : ComboData = new ComboData();
            //     if ( data['data'][0] ) {
            //         this.displayValue       = data['data'][0].display_code;
            //         returnData.display_code = data['data'][0].display_code;
            //         returnData.value_code   = changes;
    
            //         this.inputForm.patchValue({
            //             'value_search'             : this.value
            //         });
    
            //         this.selectEvent.emit(returnData);
            //     } else {
            //         returnData.display_code = '';
            //         returnData.value_code   = '';
            //         this.selectEvent.emit(returnData);
            //     }
    
            });
        }
        
    }

    onBlur(value){
        console.log(value);
        // let searchValue: string = this.inputForm.get("value_search").value;
        // this.service.getData(this.service_name,searchValue)
        // .pipe(
        //     tap( ()      => { this.loading.show(); } ),
        //     finalize( () => { this.loading.hide(); } )
        // )
        // .subscribe(data =>{
        //     this.displayValue = "";
        //     let returnData : ComboData = new ComboData();
        //     if ( data['data'][0] ) {
        //         this.displayValue = data['data'][0].display_code;
        //         returnData.display_code = data['data'][0].display_code;
        //         returnData.value_code   = searchValue;
        //         this.selectEvent.emit(returnData);
        //     } else {
        //         returnData.display_code = '';
        //         returnData.value_code   = '';
        //         this.selectEvent.emit(returnData);
        //     }

        // });

    }

}

@Component({
    selector: 'dialog-position',
    templateUrl: 'dialog-position.html',
    styleUrls: ['dialog-position.css']
})
export class DialogPosition implements OnInit {

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    public comboDatas      : ComboData[] = [];

    service_name           : string = "get_position_list";

    selectedItem           : ComboData;

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        public dialogRef: MatDialogRef<DialogPosition>,
        @Inject(MAT_DIALOG_DATA) public comboType: string
    ) {

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
