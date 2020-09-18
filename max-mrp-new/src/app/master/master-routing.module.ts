import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CompanyListComponent } from './company/company-list/company-list.component';
import { CompanyEditComponent } from './company/company-edit/company-edit.component';
import { FactoryListComponent } from './factory/factory-list/factory-list.component';
import { FactoryEditComponent } from './factory/factory-edit/factory-edit.component';


const routes: Routes = [
    { path: 'company',                                      component: CompanyListComponent },
    { path: 'company/edit/:id',                             component: CompanyEditComponent},
    { path: 'factory',                                      component: FactoryListComponent},
    { path: 'factory/edit/:company_code/:factory_code',     component: FactoryEditComponent},
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class MasterRoutingModule { }
