import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ShowMessageComponent } from './show-message/show-message.component';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';
import { MyComboComponent, DialogComboDialog } from './my-combo/my-combo.component';


@NgModule({
    declarations: [
        ShowMessageComponent,
        ConfirmDialogComponent,
        MyComboComponent,
        DialogComboDialog
    ],
    imports: [
        CommonModule,
        FormsModule, ReactiveFormsModule,
    ],
    exports: [
        ShowMessageComponent,
        MatDialogModule,
        MyComboComponent,
        DialogComboDialog
    ]
})
export class SharedCommonModule { }
