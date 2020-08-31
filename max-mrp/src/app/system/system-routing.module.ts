import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../service/auth.guard';

import { UnitListComponent } from './unit-list/unit-list.component';
import { UnitEditComponent } from './unit-edit/unit-edit.component';
import { ItemListComponent } from './item-list/item-list.component';
import { ItemEditComponent } from './item-edit/item-edit.component';
import { SupplierListComponent } from './supplier-list/supplier-list.component';
import { SupplierEditComponent } from './supplier-edit/supplier-edit.component';
import { CustomerListComponent } from './customer/list/list.component';
import { CustomerEditComponent } from './customer/edit/edit.component';


const routes: Routes = [
  { path: 'unit/list',                      component:UnitListComponent,canActivate:[AuthGuard]},
  { path: 'unit/edit/:unit_code',           component:UnitEditComponent,canActivate:[AuthGuard]},
  { path: 'item/list',                      component:ItemListComponent,canActivate:[AuthGuard]},
  { path: 'item/edit/:item_code',           component:ItemEditComponent,canActivate:[AuthGuard]},
  { path: 'supplier/list',                  component:SupplierListComponent,canActivate:[AuthGuard]},
  { path: 'supplier/edit/:supplier_code',   component:SupplierEditComponent,canActivate:[AuthGuard]},
  { path: 'customer/list',                  component:CustomerListComponent,canActivate:[AuthGuard]},
  { path: 'customer/edit/:customer_code',   component:CustomerEditComponent,canActivate:[AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SystemRoutingModule { }
