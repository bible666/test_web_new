import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MmseComponent } from './mmse/mmse.component'

const routes: Routes = [
    { path: 'mmse' ,                                     component: MmseComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class HealthCheckRoutingModule { }
