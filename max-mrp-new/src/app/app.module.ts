import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ServerErrorInterceptor } from './error.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppLayoutComponent } from './layout/app-layout/app-layout.component';
import { SharedTemplateModule } from './shared-template/template.module';

import { MyCommonModule } from './common/common.module';
import { SharedCommonModule } from './shared-common/shared-common.module';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { HeaderComponent } from './layout/header/header.component';
import { MyMainSidebarContainerComponent } from './layout/my-main-sidebar-container/my-main-sidebar-container.component';
import { LogoutComponent } from './logout/logout.component';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import { MatNativeDateModule } from '@angular/material/core';
import { ConfirmDialogComponent } from './shared-common/confirm-dialog/confirm-dialog.component';

@NgModule({
    declarations: [
        AppComponent,
        LoginComponent,
        DashboardComponent,
        AppLayoutComponent,
        HeaderComponent,
        MyMainSidebarContainerComponent,
        LogoutComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule,
        FormsModule, ReactiveFormsModule,
        MyCommonModule,
        SharedCommonModule,
        SharedTemplateModule,
        BrowserAnimationsModule,
        MatDialogModule,
        MatNativeDateModule
    ],
    providers: [
        { provide: HTTP_INTERCEPTORS, useClass: ServerErrorInterceptor, multi: true }
    ],
    bootstrap: [AppComponent],
    entryComponents: [ConfirmDialogComponent]
})
export class AppModule { }
