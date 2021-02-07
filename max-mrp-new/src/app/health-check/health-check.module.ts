import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HealthCheckRoutingModule } from './health-check-routing.module';
import { MmseComponent } from './mmse/mmse.component';


@NgModule({
  declarations: [MmseComponent],
  imports: [
    CommonModule,
    HealthCheckRoutingModule
  ]
})
export class HealthCheckModule { }
