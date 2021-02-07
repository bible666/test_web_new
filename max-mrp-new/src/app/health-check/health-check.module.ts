import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HealthCheckRoutingModule } from './health-check-routing.module';
import { MmseComponent } from './mmse/mmse.component';
import { ExaminersComponent } from './examiners/examiners.component';


@NgModule({
  declarations: [MmseComponent, ExaminersComponent],
  imports: [
    CommonModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
