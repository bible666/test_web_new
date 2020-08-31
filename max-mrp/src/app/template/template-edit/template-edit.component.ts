import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormBuilder, FormArray } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { UserService } from '../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { StaffService, cSearch } from '../../service/staff.service';
import { Observable, forkJoin } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../common/confirm-dialog/confirm-dialog.component'

@Component({
  selector: 'app-template-edit',
  templateUrl: './template-edit.component.html',
  styleUrls: ['./template-edit.component.css']
})
export class TemplateEditComponent implements OnInit {

  public message: MessageClass[] = [];
  
  inputForm = new FormGroup({
    'txt1'        : new FormControl(''),
    'txt2'        : new FormControl(''),
    'txt3'        : new FormControl(''),
    'txt4'        : new FormControl(''),
    'rowsPerpage' : new FormControl('')
  });

  isLoading :boolean = false;

  constructor(
    private router: Router,
    private routerParam: ActivatedRoute,
    private messageService: MessageService
  ) { }

  ngOnInit() {
    this.routerParam.params.subscribe(params=>{
      console.log(params)
    })
  }

  onClickSave(){
    this.isLoading = true;
    setTimeout( ()=>{
      this.isLoading = false;
      this.messageService.setWarning('บันทึกสำเร็จ');
      this.router.navigateByUrl('template/list');
    },1000);
    
  }

  onClickBack(){
    this.router.navigateByUrl('template/list');
  }

}
