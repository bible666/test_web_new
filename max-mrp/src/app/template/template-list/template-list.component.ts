import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { UserService } from '../../service/user.service';
import { Router } from '@angular/router';
import { StaffService, cSearch } from '../../service/staff.service';
import { Observable, forkJoin } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../common/confirm-dialog/confirm-dialog.component'

@Component({
  selector: 'app-template-list',
  templateUrl: './template-list.component.html',
  styleUrls: ['./template-list.component.css']
})
export class TemplateListComponent implements OnInit {

  public message: MessageClass[] = [];

  public CountData     : number = 20;
  public CurrentPage   : number = 3;
  public AllPage       : number = 13;

  inputForm = new FormGroup({
    'txt1'        : new FormControl(''),
    'txt2'        : new FormControl(''),
    'txt3'        : new FormControl(''),
    'txt4'        : new FormControl(''),
    'rowsPerpage' : new FormControl('')
  });

  constructor(
    private service: StaffService,
    public dialog: MatDialog,
    private messageService: MessageService
  ) {
    //set inital value when open form
    this.onInitValue();
  }

  ngOnInit() {
    this.message = this.messageService.getMessage();
  }

  onInitValue(){
    this.inputForm.patchValue({
      'txt4'    : 'test4'
    });
  }

  onSearch(){
    let frm_data  : cSearch = new cSearch();

    //Case Call 1 Service
    //this.service.getListData(frm_data).subscribe(data=>{
    //  console.log(data['data'].length);
    //  this.CountData    = data['data'].length;
    //  this.CurrentPage  = 1;
    //  this.AllPage      = Math.round(this.CountData / 5);
    //});

    //Case Call moer then 1 service
    //forkJoin([
    //  this.service.getListData(frm_data),
    //  this.service.getListData2(frm_data)]).subscribe(results=>{
    //    //console.log(results[0]),
    //    //console.log(results[1])
    //})

  }

  onClear(){
    this.onInitValue();
  }

  onSelectPage(PageNumber:number){
    this.CurrentPage = PageNumber;
  }

  onDelete(id:number){
    const dialogRef = this.dialog.open(ConfirmDialogComponent,{
			width: '350px',
			height: '200px',
			data: {description: 'ต้องการ',id:id}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
				//console.log(result);
				//start delete data
				//localStorage.setItem( this.localNameInput + '.delete_id',result);
				// this.unitS.deleteById().subscribe(data =>{
				// 	if (data['status'] == 'success'){
				// 		this.snackBar.openFromComponent(MyMessageComponent,{
				// 			data:[this.texts['common.delete_complete']],
				// 			duration:5000,
				// 			panelClass:['mat-snack-bar-container-message']
				// 		})
				// 		this.ngOnInit();
				// 	} else {
				// 		console.log(data['message']);
				// 	}
        // });
        //alert('click ok');
			}
		});
  }

}
