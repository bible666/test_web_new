import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';
import { SharedCommonModule } from '../shared-common/shared-common.module';
import { TranslateModule } from '@ngx-translate/core';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { TooltipModule } from 'primeng/tooltip';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { CalendarModule } from 'primeng/calendar';
import { InputNumberModule } from 'primeng/inputnumber';
import { DataViewModule } from 'primeng/dataview';

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
    TranslateModule,AutoCompleteModule,
    TableModule,ButtonModule,TooltipModule,
    CalendarModule,InputNumberModule, DataViewModule,
    SharedCommonModule,
    FormsModule,ReactiveFormsModule,
    SharedTemplateModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
