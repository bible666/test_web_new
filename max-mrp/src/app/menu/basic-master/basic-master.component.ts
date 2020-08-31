import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-basic-master',
  templateUrl: './basic-master.component.html',
  styleUrls: ['./basic-master.component.css']
})
export class BasicMasterComponent implements OnInit {

  public message: string;
  
  constructor() { }

  ngOnInit(): void {
  }

}
