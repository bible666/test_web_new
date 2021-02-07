import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-mmse',
  templateUrl: './mmse.component.html',
  styleUrls: ['./mmse.component.css']
})
export class MmseComponent implements OnInit {

    inputForm = new FormGroup({
        'company_code'        : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
        'company_name'        : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
        'address'             : new FormControl(''),
        'zip'                 : new FormControl(''),
        'telno'               : new FormControl(''),
        'faxno'               : new FormControl(''),
        'email'               : new FormControl(''),
        'cal_no'              : new FormControl(-1),
        'remark'              : new FormControl('', [ Validators.maxLength(200) ])
    });
    
    constructor(
        private param           : ActivatedRoute,
        private ServiceMessage  : MessageService,
        private router          : Router
    ) { }

    ngOnInit(): void {
        window.scroll(0,0);
    }

}
