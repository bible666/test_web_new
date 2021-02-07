import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MmseComponent } from './mmse/mmse.component'
import { ExaminersComponent } from './examiners/examiners.component';

const routes: Routes = [
    { path: 'mmse' ,          component: MmseComponent },
    { path: 'examiners' ,     component: ExaminersComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HealthCheckRoutingModule { }
