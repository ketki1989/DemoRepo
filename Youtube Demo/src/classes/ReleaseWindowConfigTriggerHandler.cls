public class ReleaseWindowConfigTriggerHandler{

    public static void handleBeforeInsert(){
    
        system.debug( 'inside handle before insert');
        
        Integer count=[SELECT count() from Release_Window_Config__c];
           if(count>=1)
           {
              throw new DmlException('Cannot insert more records.Edit Existing Record');
            }
        
    }
    
    
    
    
    
    public static void handleAfterInsertUpdate(String mNew,String mOld){
    
        if (!mOld.equals(mNew)){
             if(mNew== 'Lock'){
             
                 //clear current backup
                 ManageUserLockout.deleteProfileBackup();
                 
                 //backup users to profileBackup object
                  ManageUserLockout.profileBackup();
                          
                    //lock out users
                   ManageUserLockout.lockUsers();
                  
                  }
        }
     
        if(mNew== 'Unlock'){
              //take user records from profilebackup object and update user object
              ManageUserLockout.unlockUsers();
         }
    }
}