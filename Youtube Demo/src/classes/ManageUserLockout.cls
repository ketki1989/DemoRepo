public class ManageUserLockout{

  @future
    public static void lockUsers(List<String> profiles) {
    
        UpdateUserRecordsBatch batchUpdateUsers = new UpdateUserRecordsBatch();
        Database.BatchableContext BC; 
         List<User> lockOutUsers =[SELECT Id , Original_Profile_ID__c , ProfileId FROM User Where UserName='kevin.jose@salesforce.com' AND ProfileId IN :profiles];
    
        //change users current profile IT to UserLockOut profile ID
        Profile maint_profile = [SELECT id FROM Profile WHERE Name = 'UserLockOut'];
        for(User u: lockOutUsers){
            u.Original_Profile_ID__c =u.ProfileId ;
            u.ProfileId = maint_profile.Id;
            }
        //update userList;
        batchUpdateUsers.execute(BC, lockOutUsers);
    }
    
   
   @future
    public static void unlockUsers(List<String> profiles) {
    
     UpdateUserRecordsBatch batchUpdateUsers = new UpdateUserRecordsBatch();
     Database.BatchableContext BC; 
    
     List<User> lockOutUsers =[SELECT Id , Original_Profile_ID__c FROM User Where ProfileId IN (SELECT Id FROM Profile WHERE Name='UserLockOut')];
     List<User> userList=new List<User>();
     for (User u: lockOutUsers)
     {  
       if(string.isNotEmpty(u.Original_Profile_ID__c))
       {
         u.ProfileId = u.Original_Profile_ID__c;
         userList.add(u);
       }
      }
       // update userList;
       batchUpdateUsers.execute(BC, userList);
    }
    
     
    
    /*public static void deleteProfileBackup() {
    
                        List<ProfileBackup__c>  prbckupList = [SELECT  Profile_ID__c , User_Id__c FROM ProfileBackup__c];
                        delete prbckupList;
    }
    
     
    public static void profileBackup() {
    
                //backup users to profileBackup object
                 List<ProfileBackup__c> profileBackupList=new List<ProfileBackup__c>();
                 for (User u : [SELECT Id,ProfileId FROM User WHERE IsActive = true AND Profile.Name != 'System Administrator' AND id !=: UserInfo.getUserId()])
                  {
                     ProfileBackup__c profilebackuplog=new ProfileBackup__c(User_Id__c =u.id , Profile_ID__c =u.ProfileId );
                     profileBackupList.add(profilebackuplog);
                   }
                 insert profileBackupList;
    }*/
    
}