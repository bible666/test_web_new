import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';

import { MasterRoutingModule } from './master-routing.module';
import { CompanyListComponent } from './company/company-list/company-list.component';


@NgModule({
  declarations: [CompanyListComponent],
  imports: [
    CommonModule,
    MasterRoutingModule,
    SharedTemplateModule,
    FormsModule, ReactiveFormsModule
  ]
})
export class MasterModule { }
