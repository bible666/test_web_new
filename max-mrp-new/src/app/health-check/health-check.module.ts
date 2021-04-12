import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';
import { SharedCommonModule } from '../shared-common/shared-common.module';
import { TranslateModule } from '@ngx-translate/core';

import { HealthCheckRoutingModule } from './health-check-routing.module';
import { MmseComponent } from './mmse/mmse.component';
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';
import { CheckMenuComponent } from './check-menu/check-menu.component';
import { FlailIndexComponent } from './flail-a/flail-index/flail-index.component';
import { FlailEditComponent } from './flail-a/flail-edit/flail-edit.component';
import { FlailReportComponent } from './flail-a/flail-report/flail-report.component';


@NgModule({
  declarations: [MmseComponent, ExaminersComponent, ExaminersEditComponent, CheckMenuComponent, FlailIndexComponent, FlailEditComponent, FlailReportComponent],
  imports: [
    CommonModule,
    TranslateModule,
    SharedCommonModule,
    FormsModule,ReactiveFormsModule,
    SharedTemplateModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
