import { Component, OnInit, Input, SimpleChanges } from '@angular/core';
import { tap, finalize } from 'rxjs/operators';
import { MessageService, MessageClass } from '../../service/message.service';
import { LoadingService } from '../../service/loading.service';

//Manual add service for this page
import { ExaminersService } from '../../service/examiners.service';

@Component({
  selector: 'examiner-header',
  templateUrl: './examiner-header.component.html',
  styleUrls: ['./examiner-header.component.css']
})
export class ExaminerHeaderComponent implements OnInit {

    @Input() examiner_id: number;

    public message      : MessageClass[] = [];

    public examiner_code     : string;
    public examinerFirstName : string;
    public examinerLastName  : string;

    constructor(
        private ServiceMessage  : MessageService,
        public loading         : LoadingService,
        private examinerService : ExaminersService
    ) { }

    ngOnInit(): void {
        //get examiner data
        this.examinerService.getDataById(this.examiner_id)
        .pipe(
            tap(()=>{this.loading.show();}),
            finalize(()=>{this.loading.hide();})
        )
        .subscribe(
            data=>{
                if (data['data']){
                    this.examiner_code     = data['data'].examiner_code;
                    this.examinerFirstName = data['data'].first_name;
                    this.examinerLastName  = data['data'].last_name;
                }
            },
            error=>{
                this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                this.message = this.ServiceMessage.getMessage();
            }
        );
    }

    ngOnChanges(changes: SimpleChanges) {
        for (const propName in changes) {
            if (changes.hasOwnProperty(propName)) {
                let change = changes[propName];
                switch (propName) {
                    case 'examiner_id': {
                        //get examiner data
                        this.examinerService.getDataById(change.currentValue)
                        .pipe(
                            tap(()=>{this.loading.show();}),
                            finalize(()=>{this.loading.hide();})
                        )
                        .subscribe(
                            data=>{
                                if (data['data']){
                                    this.examiner_code     = data['data'].examiner_code;
                                    this.examinerFirstName = data['data'].first_name;
                                    this.examinerLastName  = data['data'].last_name;
                                }
                            },
                            error=>{
                                this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
                                this.message = this.ServiceMessage.getMessage();
                            }
                        );
                      }
                }
            }
        }
        // only run when property "data" changed
        //console.log(changeValue['data']);
        //if (changes['data']) {
        //    this.groupPosts = this.groupByCategory(this.data);
        //}
    }

}
