import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';
import { MasterMenuComponent } from './menu/master-menu/master-menu.component';
import { BasicMasterComponent } from './menu/basic-master/basic-master.component';
import { TransactionMasterComponent } from './menu/transaction-master/transaction-master.component';
import { AdminMasterComponent } from './menu/admin-master/admin-master.component';
import { CurrencyListComponent } from './master/currency/currency-list/currency-list.component';
import { CurrencyEditComponent } from './master/currency/currency-edit/currency-edit.component';
import { CalendarListComponent } from './master/calendar/calendar-list/calendar-list.component';
import { CalendarEditComponent } from './master/calendar/calendar-edit/calendar-edit.component';
import { CompanyEditComponent } from './master/company/company-edit/company-edit.component';
import { CompanyListComponent } from './master/company/company-list/company-list.component';
import { FactoryEditComponent } from './master/factory/factory-edit/factory-edit.component';
import { FactoryListComponent } from './master/factory/factory-list/factory-list.component';
import { LocationListComponent } from './master/location/location-list/location-list.component';
import { LocationEditComponent } from './master/location/location-edit/location-edit.component';
import { PurchaseModule } from './purchase/purchase.module';
import { SystemModule } from './system/system.module';
import { StockModule } from './stock/stock.module';

const routes: Routes = [
  {
    path:'purchase',
    loadChildren: () => PurchaseModule
  },
  {
    path:'system',
    loadChildren: () => SystemModule
  },
  {
    path:'stock',
    loadChildren: () => StockModule
  },
  { path: '' ,                          component: MainMenuComponent ,canActivate:[AuthGuard]},
  { path: 'login',                      component:LoginComponent},
  { path: 'logout',                     component:LogoutComponent},
  { path: 'main-menu/:menu_id',         component:MainMenuComponent,canActivate:[AuthGuard],runGuardsAndResolvers: 'always'},
  { path: 'master-menu',                component:MasterMenuComponent,canActivate:[AuthGuard]},
  { path: 'basic-master-menu',          component:BasicMasterComponent,canActivate:[AuthGuard]},
  { path: 'transaction-master-menu',    component:TransactionMasterComponent,canActivate:[AuthGuard]},
  { path: 'admin-master-menu',          component:AdminMasterComponent,canActivate:[AuthGuard]},
  { path: 'template/list',              component:TemplateListComponent,canActivate:[AuthGuard]},
  { path: 'template/edit/:id',          component:TemplateEditComponent,canActivate:[AuthGuard]},
  { path: 'currency/list',              component:CurrencyListComponent,canActivate:[AuthGuard]},
  { path: 'currency/edit/:id',          component:CurrencyEditComponent,canActivate:[AuthGuard]},
  { path: 'calendar/list',              component:CalendarListComponent,canActivate:[AuthGuard]},
  { path: 'calendar/edit/:id',          component:CalendarEditComponent,canActivate:[AuthGuard]},
  { path: 'company/list',               component:CompanyListComponent,canActivate:[AuthGuard]},
  { path: 'company/edit/:id',           component:CompanyEditComponent,canActivate:[AuthGuard]},
  { path: 'factory/list',               component:FactoryListComponent,canActivate:[AuthGuard]},
  { path: 'factory/edit/:company_code/:factory_code',           component:FactoryEditComponent,canActivate:[AuthGuard]},
  { path: 'location/list',               component:LocationListComponent,canActivate:[AuthGuard]},
  { path: 'location/edit/:factory_code/:location_code',           component:LocationEditComponent,canActivate:[AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { onSameUrlNavigation: 'reload' , useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
