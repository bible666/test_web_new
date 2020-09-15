import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';

import { ShowMessageComponent } from './show-message/show-message.component';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';


@NgModule({
    declarations: [
        ShowMessageComponent,
        ConfirmDialogComponent
    ],
    imports: [
        CommonModule
    ],
    exports: [
        ShowMessageComponent,
        MatDialogModule
    ]
})
export class SharedCommonModule { }
