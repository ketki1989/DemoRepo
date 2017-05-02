trigger ReleaseTrackerTrigger on Release_Tracker__c (before insert, before update) {
  
   
   
    
    for (Release_Tracker__c rel : Trigger.new){
        
        String oldStatus = '';
        
        if( Trigger.isUpdate==true)
             oldStatus = Trigger.oldMap.get(rel.Id).Status__c;
             
           
      if ((oldStatus == '' || oldStatus != rel.Status__c) && rel.Status__c=='Open'){
          
           ManageUserLockout.lockUsers(rel.profiles_to_lock__C.split(';'));
           break;
        }
       else if ( oldStatus != rel.Status__c &&  oldStatus =='Open'){
                ManageUserLockout.unlockUsers(rel.profiles_to_lock__C.split(';'));
               break;
       }
      
         
      }
 
  //when outside for loop invoke lock or unlock depending upon the flag
  //the reason we need two different flags is that there is a possibility that we may not need to lock or unlock when trigger fires and there 
  // is no change in status

}