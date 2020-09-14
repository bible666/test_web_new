import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MasterRoutingModule } from './master-routing.module';
import { CompanyComponent } from './company/company.component';


@NgModule({
  declarations: [CompanyComponent],
  imports: [
    CommonModule,
    MasterRoutingModule
  ]
})
export class MasterModule { }
