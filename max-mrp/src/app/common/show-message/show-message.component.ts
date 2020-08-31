import { Component, OnInit, Input } from '@angular/core';
import { MessageClass } from '../../service/message.service';

@Component({
  selector: 'show-message',
  templateUrl: './show-message.component.html',
  styleUrls: ['./show-message.component.css']
})
export class ShowMessageComponent implements OnInit {

  @Input() message: MessageClass[]  = [];

  constructor() { }

  ngOnInit() {

  }

}
