import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDialogModule } from '@angular/material/dialog';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { ShowMessageComponent } from './show-message/show-message.component';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';
import { MyComboComponent, DialogComboDialog } from './my-combo/my-combo.component';
import { ComboPositionComponent } from './combo-position/combo-position.component';
import { ExaminerHeaderComponent } from './examiner-header/examiner-header.component';


@NgModule({
    declarations: [
        ShowMessageComponent,
        ConfirmDialogComponent,
        MyComboComponent,
        DialogComboDialog,
        ComboPositionComponent,
        ExaminerHeaderComponent
    ],
    imports: [
        CommonModule,
        FormsModule, ReactiveFormsModule,
    ],
    exports: [
        ShowMessageComponent,
        MatDialogModule,
        MyComboComponent,
        DialogComboDialog,
        ComboPositionComponent,
        ExaminerHeaderComponent
    ]
})
export class SharedCommonModule { }
