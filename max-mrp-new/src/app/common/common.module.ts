import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CommonRoutingModule } from './common-routing.module';
import { TemplateIndexComponent } from './template-index/template-index.component';
import { TemplateIndex2Component } from './template-index2/template-index2.component';


import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
    declarations: [
        TemplateIndexComponent,
        TemplateIndex2Component
    ],
    imports: [
        CommonModule,
        CommonRoutingModule,
        FormsModule,
        ReactiveFormsModule
    ],
    exports: [

    ]
})
export class MyCommonModule { }
