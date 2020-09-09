import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ServerErrorInterceptor } from './error.service';

import { AppLayoutComponent } from './layout/app-layout/app-layout.component';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';

@NgModule({
    declarations: [
        AppComponent,
        LoginComponent,
        DashboardComponent,
        AppLayoutComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule
    ],
    providers: [
        { provide: HTTP_INTERCEPTORS, useClass: ServerErrorInterceptor, multi: true }
    ],
    bootstrap: [AppComponent]
})
export class AppModule { }
