trigger UserTrigger on User (before insert,before update) {

    //UpdateUserRecordsBatch batchUpdateUsers = new UpdateUserRecordsBatch();
    //Database.BatchableContext BC;
    //users to be updated
    //List<User> lstUserToUpd=new List<User>();
    
    string userLckprfId=[SELECT Id from Profile where Name='UserLockOut'][0].ID;

    
    for(User u: Trigger.New){
               
               
                if(u.ProfileId != userLckprfId )
                {
                    //set original user profile Id
                    u.Original_Profile_ID__c = u.ProfileId;
                  
                    
                }
        
               
               
                //string prevProfileId ='';
                
                
                
                
                //get previous profile of user
                /*if(Trigger.oldMap.get(u.id) != null)
                prevProfileId = (Trigger.oldMap.get(u.id)).ProfileId;
                                
                if(prevProfileId != userLckprfId && u.ProfileId != prevProfileId)
                {
                    //set original user profile Id
                    u.Original_Profile_ID__c = u.ProfileId;
                   // lstUserToUpd.add(u);
                    system.debug('user updated');
                }*/
        
    }
    
   // if(lstUserToUpd != null && !lstUserToUpd.isEmpty())
     //update lstUserToUpd;
    // batchUpdateUsers.execute(BC, lstUserToUpd);
}