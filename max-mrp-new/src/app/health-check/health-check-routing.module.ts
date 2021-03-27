import { Component, NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MmseComponent } from './mmse/mmse.component'
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';
import { CheckMenuComponent } from './check-menu/check-menu.component';
import { FlailIndexComponent } from './flail-a/flail-index/flail-index.component';
import { FlailEditComponent } from './flail-a/flail-edit/flail-edit.component';
import { FlailReportComponent } from './flail-a/flail-report/flail-report.component';

const routes: Routes = [
    { path: 'mmse' ,                            component: MmseComponent },
    { path: 'examiners' ,                       component: ExaminersComponent},
    { path: 'examiners/edit/:examiner_id' ,     component: ExaminersEditComponent},
    { path: 'check-menu/:examiner_id',          component: CheckMenuComponent},
    { path: 'flail-a/index/:examiner_id',       component: FlailIndexComponent},
    { path: 'flail-a/edit/:test_id',            component: FlailEditComponent},
    { path: 'flail-a/report/:test_id',          component: FlailReportComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HealthCheckRoutingModule { }
