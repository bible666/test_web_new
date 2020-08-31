import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
 })
export class LoadingService {

  public _selector:string = 'loading';
  public _element:HTMLElement;

  constructor() {
    this._element = document.getElementById(this._selector);
  }

  public show(){
    this._element.style['display'] = 'block';
  }

  public hide(delay:number = 0):void {
    setTimeout(() => {
      this._element.style['display'] = 'none';
    }, delay);
  }
}
