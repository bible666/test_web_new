import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedCommonModule } from '../common/common.module'
import { SharedTemplateModule } from '../template/template.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatButtonModule } from '@angular/material/button';
import {MatSelectModule} from '@angular/material/select';
import {MAT_FORM_FIELD_DEFAULT_OPTIONS} from '@angular/material/form-field';


import { StockRoutingModule } from './stock-routing.module';
import { TransferComponent } from './transfer/transfer.component';

@NgModule({
  declarations: [TransferComponent],
  imports: [
    CommonModule,
    StockRoutingModule,
    SharedCommonModule,
    SharedTemplateModule,
    FormsModule, ReactiveFormsModule,
    MatCheckboxModule,
    MatFormFieldModule, 
    MatInputModule,
    MatAutocompleteModule,
    MatProgressSpinnerModule,
    MatButtonModule,
    MatSelectModule
  ],
  providers: [
    { provide: MAT_FORM_FIELD_DEFAULT_OPTIONS, useValue: { appearance: 'fill' } },
  ]
})
export class StockModule { }
