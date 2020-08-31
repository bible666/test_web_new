import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../common/confirm-dialog/confirm-dialog.component'
import { LoadingService } from '../../service/loading.service';
import { ItemQtyComponent } from '../../common/item-qty/item-qty.component';
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';

import { TransferService } from '../../service/transfer.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
    selector: 'app-transfer',
    templateUrl: './transfer.component.html',
    styleUrls: ['./transfer.component.css']
})
export class TransferComponent implements OnInit {

    public message          : MessageClass[]    = [];
    public ar_location      : any[]             = [];
    public ar_grid_data     : cGridData[]       = [];
    public seq              : number            = 0;

    inputForm = new FormGroup({
        'location_from'     : new FormControl(''),
        'location_to'     : new FormControl(''),
    });

    constructor(
        public dialog: MatDialog,
        private messageService: MessageService,
        private service: TransferService,
        private loading: LoadingService
    ) { }

    ngOnInit(): void {
        window.scroll(0,0);
        this.service.getLocation()
        .pipe(
            tap(()         =>{
                this.loading.show();
            }),
            finalize(()    =>{
                this.loading.hide();
            })
        )
        .subscribe( data => {
            if ( data['status'] == 'success' ){
                this.ar_location = data['data'];
            } 
        },
        error=>{
            //this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
            //this.message = this.ServiceMessage.getMessage();
            console.log(error.message);
        });

        //init data
        this.ar_grid_data   = [];
        this.seq            = 0;
    }

    onAdd() {

        const dialogRef = this.dialog.open(ItemQtyComponent,{
            width:  '500px',
            height: '300px',
            data: {
                location_code:this.inputForm.value['location_from']
            },
        })

        dialogRef.afterClosed().subscribe(result=>{
            if (!result){
                //cancel delete data
                //alert('hiii');
            } else {
                // update seq
                this.seq        += 1;

                //conver result data to class
                let insert_grid             : cGridData;
                insert_grid                 = new cGridData();
                insert_grid.id              = this.seq;
                insert_grid.item_code       = result['item_code'];
                insert_grid.item_name       = result['item_name'];
                insert_grid.unit_name       = result['unit_name'];
                insert_grid.lot_no          = result['lot_no'];
                insert_grid.receive_date    = result['first_receive_date'];
                insert_grid.quantity        = +result['quantity'];

                //add class to array
                this.ar_grid_data.push(insert_grid);
                
            }
        });

    }

}

export class cLocation{
    public user_id:           number;
    public user_group_id:     number;
    public department_code:   string;
    public factory_code:      string;
    public location_code:     string;
}

export class cGridData{
    public id               : number;
    public item_code        : string;
    public item_name        : string;
    public unit_name        : string;
    public lot_no           : string;
    public receive_date     : Date;
    public quantity         : number;
}
