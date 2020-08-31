import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { ItemService, cSearch, cData } from '../../service/item.service';
import { MatDialog } from '@angular/material/dialog';
import { LoadingService } from '../../service/loading.service';
import { ConfirmDialogComponent } from '../../common/confirm-dialog/confirm-dialog.component'
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';

@Component({
  selector: 'app-item-list',
  templateUrl: './item-list.component.html',
  styleUrls: ['./item-list.component.css']
})
export class ItemListComponent implements OnInit {

  public message: MessageClass[] = [];

  public CountData      : number = 20;
  public CurrentPage    : number = 1;
  public AllPage        : number = 13;
  public gridDatas      : cData[] = [];
  public frmSearchData  : cSearch;

  inputForm = new FormGroup({
    'item_code'     : new FormControl(''),
    'item_name'     : new FormControl(''),
    'rowsPerpage'   : new FormControl('20')
  });

  constructor(
    private service: ItemService,
    public dialog: MatDialog,
    private messageService: MessageService,
    private loading: LoadingService
  ) {
    //set inital value when open form
    this.onInitValue();
  }

  ngOnInit() {
    window.scroll(0,0);
    this.onSearch();
  }

  onInitValue(){
    this.inputForm.patchValue({
      'item_code'    : '',
      'item_name'    : ''
    });
  }

  onSearch(){
    //set current page to 1
    this.CurrentPage  = 1;

    //set form value to class search
    this.frmSearchData = new cSearch(this.inputForm.value);

    this.frmSearchData.page_index   = this.CurrentPage;
    this.frmSearchData.rowsPerpage  = this.inputForm.value.rowsPerpage;
    this.getData();
    this.message = this.messageService.getMessage();

  }

  getData(){
    this.frmSearchData.page_index = this.CurrentPage;
    this.service.getListData(this.frmSearchData)
    .pipe(
      tap(()=>{this.loading.show();}),
      finalize(()=>{this.loading.hide();})
    )
    .subscribe(data => {
      if (data['status'] == 'success'){
        this.CountData    = data['max_rows'];
        this.AllPage      = Math.ceil(this.CountData / this.inputForm.value.rowsPerpage);
        this.gridDatas     = data['data'];
      }
      
    });
  }

  onClear(){
    this.onInitValue();
    this.onSearch();
  }

  onSelectPage(PageNumber:number){
    this.CurrentPage = PageNumber;
    this.getData();
  }

  onDelete(item_code:string){

    const dialogRef = this.dialog.open(ConfirmDialogComponent,{
			width: '350px',
			height: '200px',
			data: {description: 'คุณต้องการลบรายการนี้หรือเปล่า ',id:item_code}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
        this.service.deleteById(item_code)
        .pipe(
          tap(()=>{this.loading.show();}),
          finalize(()=>{this.loading.hide();})
        )
        .subscribe(data=>{
          this.messageService.setSuccess('ทำการลบเสร็จแล้ว');
          this.onSearch();

        },
        error=>{
            this.messageService.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
            this.message = this.messageService.getMessage();
        });
				
			}
		});
  }

}



