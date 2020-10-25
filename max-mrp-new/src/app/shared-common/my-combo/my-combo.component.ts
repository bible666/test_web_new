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
            tap( ()      => { this.loading.show(); } ),
            finalize( () => { this.loading.hide(); } )
        )
        .subscribe(data =>{
            this.displayValue = "";
            if ( data['data'][0] ) {
                this.displayValue = data['data'][0].display_code;
            }

        });

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

    service_name           : string = "";

    constructor(
        private service: ComboService,
        private loading: LoadingService,
        @Inject(MAT_DIALOG_DATA) public comboType: string
    ) {
        this.service_name = "";

        switch ( this.comboType ) {
            case "unit": {
                this.service_name = "get_unit_list";
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
  
}