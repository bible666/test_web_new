import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CompanyListComponent } from './company/company-list/company-list.component';
import { CompanyEditComponent } from './company/company-edit/company-edit.component';
import { FactoryListComponent } from './factory/factory-list/factory-list.component';
import { FactoryEditComponent } from './factory/factory-edit/factory-edit.component';
import { LocationEditComponent } from './location/location-edit/location-edit.component';
import { LocationListComponent } from './location/location-list/location-list.component';
import { ItemListComponent } from './item/item-list/item-list.component';
import { ItemEditComponent } from './item/item-edit/item-edit.component';
import { UnitListComponent } from './unit/unit-list/unit-list.component';
import { UnitEditComponent } from './unit/unit-edit/unit-edit.component';


const routes: Routes = [
    { path: 'company' ,                                     component: CompanyListComponent },
    { path: 'company/edit/:id' ,                            component: CompanyEditComponent },
    { path: 'factory' ,                                     component: FactoryListComponent },
    { path: 'factory/edit/:company_code/:factory_code' ,    component: FactoryEditComponent },
    { path: 'location' ,                                    component: LocationListComponent },
    { path: 'location/edit/:factory_code/:location_code' ,  component: LocationEditComponent },
    { path: 'item' ,                                        component: ItemListComponent },
    { path: 'item/edit/:item_code',                         component: ItemEditComponent },
    { path: 'unit' ,                                        component: UnitListComponent },
    { path: 'unit/edit/:unit_code',                         component: UnitEditComponent }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class MasterRoutingModule { }
