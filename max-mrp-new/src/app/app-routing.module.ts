import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { AppLayoutComponent } from './layout/app-layout/app-layout.component';

import { MyCommonModule } from './common/common.module';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';


const routes: Routes = [
    {
        path: 'common',
        component: AppLayoutComponent, 
        loadChildren: () => MyCommonModule 
    },
    { path: 'login',                      component:LoginComponent},
    { path: '' ,                          component: DashboardComponent ,canActivate:[AuthGuard]},
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
