import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MmseComponent } from './mmse/mmse.component'
import { ExaminersComponent } from './examiners/examiners.component';
import { ExaminersEditComponent } from './examiners-edit/examiners-edit.component';

const routes: Routes = [
    { path: 'mmse' ,                         component: MmseComponent },
    { path: 'examiners' ,                    component: ExaminersComponent},
    { path: 'examiners/edit/:examiner_id' ,  component: ExaminersEditComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HealthCheckRoutingModule { }
