trigger ReleaseWindowConfigTrigger on Release_Window_Config__c (after insert,before insert,after update) {
    if(Trigger.isBefore && Trigger.isInsert){
       // ReleaseWindowConfigTriggerHandler.handleBeforeInsert();
      system.debug('insidetrigger1');
       
    }
    
    else
    {
     for (Release_Window_Config__c mNew : Trigger.new){
     
    
    
    
     if (Trigger.isafter && Trigger.isInsert) {
    
    system.debug('insidetrigger'+ mNew.profiles_to_lock__c );
        
    
    
           // ReleaseWindowConfigTriggerHandler.handleAfterInsertUpdate(mNew.UserLockoutStatus__c, 'dummy');
    
         }
    else{
       
     
     system.debug('insidetrigger'+ mNew.profiles_to_lock__c );
       
         //   Release_Window_Config__c mOld = Trigger.oldMap.get(mNew.Id);
          //  ReleaseWindowConfigTriggerHandler.handleAfterInsertUpdate(mNew.UserLockoutStatus__c,mOld.UserLockoutStatus__c);
          
        }
    }
    }
}