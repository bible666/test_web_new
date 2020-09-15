import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';
import { SharedCommonModule } from '../shared-common/shared-common.module';

import { MasterRoutingModule } from './master-routing.module';
import { CompanyListComponent } from './company/company-list/company-list.component';
import { CompanyEditComponent } from './company/company-edit/company-edit.component';


@NgModule({
  declarations: [CompanyListComponent, CompanyEditComponent],
  imports: [
    CommonModule,
    MasterRoutingModule,
    SharedTemplateModule,
    FormsModule, ReactiveFormsModule,
    SharedCommonModule
  ]
})
export class MasterModule { }
