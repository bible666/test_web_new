import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ShowMessageComponent } from './show-message/show-message.component';


@NgModule({
    declarations: [
        ShowMessageComponent
    ],
    imports: [
        CommonModule
    ],
    exports: [
        ShowMessageComponent
    ]
})
export class SharedCommonModule { }
