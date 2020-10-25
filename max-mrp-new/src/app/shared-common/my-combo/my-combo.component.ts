import { Component, OnInit, Input, Inject } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormControl, FormGroup } from '@angular/forms';
import { ComboData, ComboService } from '../../service/combo.service';
import { tap, finalize } from 'rxjs/operators';
import { LoadingService } from '../../service/loading.service';

@Component({
  selector: 'my-combo',
  templateUrl: './my-combo.component.html',
  styleUrls: ['./my-combo.component.css']
})
export class MyComboComponent implements OnInit {

    @Input() comboType: string;
    @Input() width:     number = 20;

    comboDatas   : ComboData[];
    displayValue : string = "";
    widthText    : string = "30%";
    widthDis     : string = "60%";
    service_name : string = "";

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        public dialog: MatDialog
    ) {
        
    }

    ngOnInit(): void {

        switch ( this.comboType ) {
            case "unit": {
                this.service_name = "get_unit";
            }
            
        }
        
        this.widthText = this.width + '%';
        this.widthDis  = ( 90 - this.width) + '%';
    }

    onBlur(value: string){
        let searchValue: string = this.inputForm.get("value_search").value;
        this.service.getData(this.service_name,searchValue)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(data =>{
            this.displayValue = "";
            if ( data['data'][0] ) {
                this.displayValue = data['data'][0].display_code;
            }
            //this.comboDatas = data['data'];

            //console.log(this.comboDatas[0]);
        });
        // for (let row = 0 ; row < this.comboDatas.length ; row++){
        //     if ( value == this.comboDatas[row].value_code ) {
        //         console.log(this.comboDatas[row]);
        //         this.displayValue = this.comboDatas[row].display_code;
        //     }

        // }
    }

    onClick(){
        const dialogRef = this.dialog.open(DialogComboDialog, {
            width: '400px',
            data: this.comboType
        });
      
        dialogRef.afterClosed().subscribe(result => {
            console.log('The dialog was closed');
            //this.animal = result;
        });
    }

}


@Component({
    selector: 'dialog-combo-dialog',
    templateUrl: 'dialog-combo-dialog.html',
})
export class DialogComboDialog implements OnInit {

    inputForm = new FormGroup({
        'value_search'     : new FormControl('')
    });

    public comboDatas      : ComboData[] = [];

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        @Inject(MAT_DIALOG_DATA) public comboType: string
    ) {

    }

    ngOnInit(): void {
        console.log(this.comboType);
        let service_name : string = "";

        switch ( this.comboType ) {
            case "unit": {
                service_name = "get_unit";
            }
            
        }
        this.service.getData(service_name)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(unit =>{
            this.comboDatas = unit['data'];
            console.log(this.comboDatas[0]);
        });

    }
  
}