import { Component, OnInit ,Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';

export interface DialogData {
  id: number;
  holiday_date: Date;
  holiday_text: string;
}


@Component({
  selector: 'app-calendar-dialog',
  templateUrl: './calendar-dialog.component.html',
  styleUrls: ['./calendar-dialog.component.css']
})
export class CalendarDialogComponent implements OnInit {

  inputForm = new FormGroup({
    'holiday_date'       : new FormControl(this.data.holiday_date, [ Validators.required, Validators.maxLength(10) ]),
    'show_date'          : new FormControl(''),
    'holiday_text'       : new FormControl(this.data.holiday_text, [ Validators.required, Validators.maxLength(50) ])
  });

  constructor(
    public dialogRef: MatDialogRef<CalendarDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData)
  {

  }

  onSave(){
    if (this.inputForm.valid){
      let holiday: Date = new Date(this.inputForm.controls['holiday_date'].value);
      this.inputForm.patchValue({

        'show_date'    : holiday.getDate() + '/' + (holiday.getMonth()+1) + '/' + holiday.getFullYear()

      });

      this.dialogRef.close(this.inputForm.value);
    }
    
  }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

