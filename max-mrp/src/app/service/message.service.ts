import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MessageService {

  private messageWarning  : string[] = [];
  private messageError    : string[] = [];
  private messageSuccess  : string[] = [];

  constructor() { }

  public setWarning(message:string){
    this.messageWarning.push(message);
    //let input : MessageClass = new MessageClass();
  }

  public setError(message:string){
    this.messageError.push(message);
    //let input : MessageClass = new MessageClass();
  }

  public setSuccess(message:string){
    this.messageSuccess.push(message);
    //let input : MessageClass = new MessageClass();
  }

  public getMessage():MessageClass[]{
    let retMessage : MessageClass[] = [];

    let warningMessage: string[]  = this.messageWarning;
    let errorMessage: string[]    = this.messageError;
    let successMessage: string[]  = this.messageSuccess;

    if ( warningMessage  ){
      if (warningMessage.length > 0) {
        let warningClass  : MessageClass = new MessageClass();
        warningClass.message      = warningMessage;
        warningClass.messageType  = eMessageType.warnning;

        retMessage.push(warningClass);
      }
      
    }

    if (errorMessage  ){
      if (errorMessage.length > 0){
        let errorClass  : MessageClass = new MessageClass();
        errorClass.message      = errorMessage;
        errorClass.messageType  = eMessageType.error;
  
        retMessage.push(errorClass);
      }
      
    }

    if (successMessage){
      if (successMessage.length > 0){
        let successClass  : MessageClass = new MessageClass();
        successClass.message      = successMessage;
        successClass.messageType  = eMessageType.success;
  
        retMessage.push(successClass);
      }
      
    }

    this.messageWarning   = [];
    this.messageError     = [];
    this.messageSuccess   = [];


    return retMessage;
  }
}

export enum eMessageType {
  error     = 'error',
  warnning  = 'warnning',
  success   = 'success'
}

export class MessageClass {
  public message      : string[];
  public messageType  : eMessageType;
}

