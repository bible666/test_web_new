import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CompanyListComponent } from './company/company-list/company-list.component';
import { CompanyEditComponent } from './company/company-edit/company-edit.component';
import { FactoryListComponent } from './factory/factory-list/factory-list.component';
import { FactoryEditComponent } from './factory/factory-edit/factory-edit.component';
import { LocationEditComponent } from './location/location-edit/location-edit.component';
import { LocationListComponent } from './location/location-list/location-list.component';


const routes: Routes = [
    { path: 'company' ,                                     component: CompanyListComponent },
    { path: 'company/edit/:id' ,                            component: CompanyEditComponent },
    { path: 'factory' ,                                     component: FactoryListComponent },
    { path: 'factory/edit/:company_code/:factory_code' ,    component: FactoryEditComponent },
    { path: 'location' ,                                    component: LocationListComponent },
    { path: 'location/edit/:factory_code/:location_code' ,  component: LocationEditComponent }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class MasterRoutingModule { }
