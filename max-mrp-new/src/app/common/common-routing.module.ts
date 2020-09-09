import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TemplateIndexComponent } from './template-index/template-index.component';
import { TemplateIndex2Component } from './template-index2/template-index2.component';



const routes: Routes = [
    { path: 'templateIndex',    component: TemplateIndexComponent },
    { path: 'templateIndex2',    component: TemplateIndex2Component }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class CommonRoutingModule { }
