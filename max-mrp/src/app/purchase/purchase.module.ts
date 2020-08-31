import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PurchaseRoutingModule } from './purchase-routing.module';
import { SharedCommonModule } from '../common/common.module'


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    PurchaseRoutingModule,
    SharedCommonModule
  ]
})
export class PurchaseModule { }
