import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { AppLayoutComponent } from './layout/app-layout/app-layout.component';

import { MyCommonModule } from './common/common.module';
import { MasterModule } from './master/master.module';
import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { HealthCheckModule } from './health-check/health-check.module';


const routes: Routes = [
    {
        path: 'common',
        component: AppLayoutComponent,
        loadChildren: () => MyCommonModule
    },
    {
        path: 'master',
        component: AppLayoutComponent,
        loadChildren: () => MasterModule
    },
    {
        path: 'health',
        component: AppLayoutComponent,
        loadChildren: () => HealthCheckModule
    },
    { path: 'login',                      component:LoginComponent},
    { path: 'logout',                     component:LogoutComponent},
    {
        path: '' ,
        component: AppLayoutComponent ,
        children: [
            {
                path: '' ,
                component: DashboardComponent ,canActivate:[AuthGuard]
            }
        ]
    }
];

@NgModule({
    imports: [RouterModule.forRoot(routes, { onSameUrlNavigation: 'reload', useHash: true, relativeLinkResolution: 'legacy' })],
    exports: [RouterModule]
})
export class AppRoutingModule { }
