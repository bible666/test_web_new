import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';
import { SharedCommonModule } from '../shared-common/shared-common.module';

import { HealthCheckRoutingModule } from './health-check-routing.module';
import { MmseComponent } from './mmse/mmse.component';
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';


@NgModule({
  declarations: [MmseComponent, ExaminersComponent, ExaminersEditComponent],
  imports: [
    CommonModule,
    SharedCommonModule,
    FormsModule,ReactiveFormsModule,
    SharedTemplateModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
