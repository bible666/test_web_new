import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SharedTemplateModule } from '../shared-template/template.module';
import { SharedCommonModule } from '../shared-common/shared-common.module';

import { MasterRoutingModule } from './master-routing.module';
import { CompanyListComponent } from './company/company-list/company-list.component';
import { CompanyEditComponent } from './company/company-edit/company-edit.component';
import { FactoryListComponent } from './factory/factory-list/factory-list.component';
import { FactoryEditComponent } from './factory/factory-edit/factory-edit.component';
import { LocationListComponent } from './location/location-list/location-list.component';
import { LocationEditComponent } from './location/location-edit/location-edit.component';
import { ItemListComponent } from './item/item-list/item-list.component';
import { ItemEditComponent } from './item/item-edit/item-edit.component';
import { UnitListComponent } from './unit/unit-list/unit-list.component';
import { UnitEditComponent } from './unit/unit-edit/unit-edit.component';
import { CurrencyListComponent } from './currency/currency-list/currency-list.component';
import { CurrencyEditComponent } from './currency/currency-edit/currency-edit.component';
import { CustomerListComponent } from './customer/customer-list/customer-list.component';
import { CustomerEditComponent } from './customer/customer-edit/customer-edit.component';
import { UserListComponent } from './user/user-list/user-list.component';
import { UserEditComponent } from './user/user-edit/user-edit.component';
import { SupplierListComponent } from './supplier/supplier-list/supplier-list.component';
import { SupplierEditComponent } from './supplier/supplier-edit/supplier-edit.component';


@NgModule({
    declarations: [
        CompanyListComponent,
        CompanyEditComponent,
        FactoryListComponent,
        FactoryEditComponent,
        LocationListComponent,
        LocationEditComponent,
        ItemListComponent,
        ItemEditComponent,
        UnitListComponent,
        UnitEditComponent,
        CurrencyListComponent,
        CurrencyEditComponent,
        CustomerListComponent,
        CustomerEditComponent,
        UserListComponent,
        UserEditComponent,
        SupplierListComponent,
        SupplierEditComponent
    ],
    imports: [
        CommonModule,
        MasterRoutingModule,
        SharedTemplateModule,
        FormsModule, ReactiveFormsModule,
        SharedCommonModule
    ]
})
export class MasterModule { }
