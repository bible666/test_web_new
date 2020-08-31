import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';


@Component({
  selector: 'paginator',
  templateUrl: './paginator.component.html',
  styleUrls: ['./paginator.component.css']
})
export class PaginatorComponent implements OnInit {

  @Input() AllPage        : number;
  @Input() currentPage    : number;
  @Input() AllData        : number;
  
  @Output() clickEvent    = new EventEmitter<number>();

  options = new PaginatorClass();

  startShowPage   : number = 1;
  endShowPage     : number = 1;
  pages           : myPage[];

  constructor() { }

  ngOnInit() {
    
  }

  ngOnChanges(){
    this.getNumberStartAndEnd();
    
  }

  getNumberStartAndEnd(){
    let half = Math.round(this.options.showPage / 2);
    let end = Math.max(1 + this.options.showPage, this.currentPage + half);
    let start = Math.min( this.AllPage - this.options.showPage, this.currentPage - half - this.options.showPage % 2);

    if (this.currentPage == 1) {
      start = 1;
    }

    if ( this.currentPage == this.AllPage ){
      end = this.AllPage;
    }
    
    end   = Math.min(this.AllPage,end);
    start = Math.max(1,start);
    
    this.startShowPage  = start;
    this.endShowPage    = end;
    //console.log(this.currentPage);
    //console.log(start);
    //console.log(end);

    this.pages = [];
    for (let i = start ; i <= end; i++){
      let myPageData  : myPage = new myPage();
      myPageData.pageNumber = i;
      myPageData.activePage = false;

      if ( this.currentPage == i){
        myPageData.activePage = true;
      }

      this.pages.push(myPageData);
    }
    
    //console.log(this.pages);
  
  }

  onPageButtonClick(pageNumber){
    this.clickEvent.emit(pageNumber);
  }
  onFirstPageClick(){
    this.clickEvent.emit(1);
  }
  onLastPageClick(){
    this.clickEvent.emit(this.AllPage);
  }
  onPrevPageClick(){
    let myPage = this.currentPage;
    myPage -= 8;
    myPage = Math.max(myPage,1);
    //this.currentPage = myPage;
    this.clickEvent.emit(myPage);
  }
  onNextPageClick(){
    let myPage = this.currentPage;
    myPage += 8;
    myPage = Math.min(myPage,this.AllPage);
    //this.currentPage = myPage;
    this.clickEvent.emit(myPage);
  }
}

export class PaginatorClass {
  before    : number = 0;
  after     : number = 0;
  showPage  : number = 8; // show 9 page : 8 + 1
  first     : number = 0;
  last      : number = 0;
}

export class myPage{
  pageNumber  : number = 0;
  activePage  : boolean = false;
}


export class cRetValue{
	PageNumber		: number;
}