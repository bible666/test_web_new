import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HealthCheckRoutingModule } from './health-check-routing.module';
import { MmseComponent } from './mmse/mmse.component';
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';


@NgModule({
  declarations: [MmseComponent, ExaminersComponent, ExaminersEditComponent],
  imports: [
    CommonModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
