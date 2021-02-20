import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MmseComponent } from './mmse/mmse.component'
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';
import { CheckMenuComponent } from './check-menu/check-menu.component';

const routes: Routes = [
    { path: 'mmse' ,                         component: MmseComponent },
    { path: 'examiners' ,                    component: ExaminersComponent},
    { path: 'examiners/edit/:examiner_id' ,  component: ExaminersEditComponent},
    { path: 'check-menu/:examiner_id',       component: CheckMenuComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HealthCheckRoutingModule { }
