import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID } from '@angular/core';
import { HttpClientModule, HttpClient, HTTP_INTERCEPTORS } from '@angular/common/http';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';

import { ServerErrorInterceptor } from './error.service';

import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { ConfirmDialogComponent } from './common/confirm-dialog/confirm-dialog.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MasterMenuComponent } from './menu/master-menu/master-menu.component';
import { CurrencyEditComponent } from './master/currency/currency-edit/currency-edit.component';
import { CurrencyListComponent } from './master/currency/currency-list/currency-list.component';
import { BasicMasterComponent } from './menu/basic-master/basic-master.component';
import { TransactionMasterComponent } from './menu/transaction-master/transaction-master.component';
import { AdminMasterComponent } from './menu/admin-master/admin-master.component';
import { CalendarEditComponent } from './master/calendar/calendar-edit/calendar-edit.component';
import { CalendarListComponent } from './master/calendar/calendar-list/calendar-list.component';
import { CalendarDialogComponent } from './common/calendar-dialog/calendar-dialog.component';
import { MatMomentDateModule, MAT_MOMENT_DATE_ADAPTER_OPTIONS } from '@angular/material-moment-adapter';
import { CompanyListComponent } from './master/company/company-list/company-list.component';
import { CompanyEditComponent } from './master/company/company-edit/company-edit.component';
import { FactoryListComponent } from './master/factory/factory-list/factory-list.component';
import { FactoryEditComponent } from './master/factory/factory-edit/factory-edit.component';
import { LocationEditComponent } from './master/location/location-edit/location-edit.component';
import { LocationListComponent } from './master/location/location-list/location-list.component';

import { SharedCommonModule } from './common/common.module';
import { SharedTemplateModule } from './template/template.module';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    LogoutComponent,
    MainMenuComponent,
    TemplateListComponent,
    ConfirmDialogComponent,
    TemplateEditComponent,
    MasterMenuComponent,
    CurrencyEditComponent,
    CurrencyListComponent,
    BasicMasterComponent,
    TransactionMasterComponent,
    AdminMasterComponent,
    CalendarEditComponent,
    CalendarListComponent,
    CalendarDialogComponent,
    CompanyListComponent,
    CompanyEditComponent,
    FactoryListComponent,
    FactoryEditComponent,
    LocationEditComponent,
    LocationListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule, ReactiveFormsModule, BrowserAnimationsModule,
    MatDialogModule, MatButtonModule, MatProgressSpinnerModule,MatDatepickerModule,
    MatNativeDateModule,MatMomentDateModule,SharedCommonModule,SharedTemplateModule
  ],
  providers: [
    {provide: LOCALE_ID, useValue: "th-TH"},
    { provide: MAT_MOMENT_DATE_ADAPTER_OPTIONS, useValue: { useUtc: true } },
    { provide: HTTP_INTERCEPTORS, useClass: ServerErrorInterceptor, multi: true }
  ],
  bootstrap: [AppComponent],
  entryComponents:[ConfirmDialogComponent]
})
export class AppModule { }
