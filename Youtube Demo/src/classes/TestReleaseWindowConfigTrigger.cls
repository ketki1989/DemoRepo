@isTest
public class TestReleaseWindowConfigTrigger{
    
   
    
    static testMethod  void testBeforeInsert(){
        
          //Create test data
          Datetime today = Datetime.now();
          Release_Window_Config__c ReleaseWindowConfigRecord = new Release_Window_Config__c();
          ReleaseWindowConfigRecord.Release_Start_Date__c =today;
          ReleaseWindowConfigRecord.Release_End_Date__c=today.addDays(1);
          ReleaseWindowConfigRecord.UserLockoutStatus__c='Lock';
          insert ReleaseWindowConfigRecord;
          
          Test.startTest();
        
         //create 2nd record to test if system throw exception
         Release_Window_Config__c a = new Release_Window_Config__c();
         a.Release_Start_Date__c =today;
         a.Release_End_Date__c=today.addDays(1);
         a.UserLockoutStatus__c='Lock';
         Boolean expectedExceptionThrown = false;
         try{
            insert a;
          }
          catch(Exception e)
          {
            expectedExceptionThrown =  e.getMessage().contains('Cannot insert more records.Edit Existing Record') ? true : false;
          }
           System.AssertEquals(expectedExceptionThrown,true);
            
          Integer count= [SELECT COUNT() FROM Release_Window_Config__c];
          System.assertEquals(count,1);
        
          Test.stopTest();
    }
    
   /* static testMethod  void testAfterInsertUpdate(){
          
          //Create test data
          Datetime today = Datetime.now();
          Release_Window_Config__c ReleaseWindowConfigRecord = new Release_Window_Config__c();
          ReleaseWindowConfigRecord.Release_Start_Date__c =today;
          ReleaseWindowConfigRecord.Release_End_Date__c=today.addDays(1);
          ReleaseWindowConfigRecord.UserLockoutStatus__c='unLock';
          
          insert ReleaseWindowConfigRecord;
          
          
          Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
      
          
          User original_user = new User(Alias = 'test',
          Email='test@jci.co', 
          EmailEncodingKey='UTF-8',
          LastName='testing',
          LanguageLocaleKey='en_US', 
          LocaleSidKey='en_US',
          ProfileId = p.Id, 
          TimeZoneSidKey='America/Los_Angeles', 
          UserName='test@jci.co',
          Region__c='NA');
          
          insert original_user;
          
           
           
          Test.startTest();
          system.debug ('user original profile ' + original_user.ProfileID);
          
         
          
          //Lockout User
          ReleaseWindowConfigRecord.UserLockoutStatus__c='Lock';
          update ReleaseWindowConfigRecord;
          
          //get user object after lockout
          user userAftrLockout =[SELECT Id,ProfileId FROM user WHERE UserName = 'test@jci.co' ];
          Profile pAfterLock=[Select Name from Profile where Id = :userAftrLockout.ProfileId];
           
          system.debug ( 'pAfterLock ' + pAfterLock.Name);

          
          system.assertequals(pAfterLock.Name ,'UserLockOut');
          
          //system.debug ( 'user ' + userBfrLockout.ProfileID);
           
          //unLock User
          ReleaseWindowConfigRecord.UserLockoutStatus__c='unLock';
          update ReleaseWindowConfigRecord;
           
          //get profile ID after unlock
          user usersPrfAfterUnlock = [SELECT Id,ProfileId FROM user WHERE UserName = 'test@jci.co' ];
          Profile pAfterUnlock=[Select Name from Profile where Id = :usersPrfAfterUnlock.ProfileId];
           
          system.debug ( 'pAfterUnlock' + pAfterUnlock.Name);
          
          system.assertequals(pAfterUnlock.Name, 'Standard User');
          
          
          Test.stopTest();
    }*/
    
    static testMethod  void testAfterInsertUpdate(){
          //create release maintenance window obj
          Datetime today = Datetime.now();
          Release_Window_Config__c ReleaseWindowConfigRecord = new Release_Window_Config__c();
          ReleaseWindowConfigRecord.Release_Start_Date__c =today;
          ReleaseWindowConfigRecord.Release_End_Date__c=today.addDays(1);
          ReleaseWindowConfigRecord.UserLockoutStatus__c='unLock';
          
          
          test.StartTest();
          
          insert ReleaseWindowConfigRecord;
          
          
          //storing status of user before executing lock
          User userBfrLockout= [SELECT ProfileId FROM User WHERE username='kevin.jose@salesforce.com'];
          profile userBeforelkotprfl =[SELECT Name from Profile where Id=:userBfrLockout.ProfileId];
          
          //execute lock
          ReleaseWindowConfigRecord.UserLockoutStatus__c='Lock';
          update ReleaseWindowConfigRecord;
          
          //get user status after lockout
          User userAftrLockout= [SELECT ProfileId FROM User WHERE username='kevin.jose@salesforce.com'];
          profile userAftrLockoutprfl =[SELECT Name from Profile where Id=:userAftrLockout.ProfileId];
         
          //ensure user's profile is now set to  UserLockOut
          system.assertequals(userAftrLockoutprfl.Name , 'UserLockOut');
          
          //execute unlock
          ReleaseWindowConfigRecord.UserLockoutStatus__c='unLock';
          update ReleaseWindowConfigRecord;
          
          //get user status after unlock
          User userAftrUnLockout= [SELECT ProfileId FROM User WHERE username='kevin.jose@salesforce.com'];
          profile userAftrUnLockoutprfl =[SELECT Name from Profile where Id=:userAftrUnLockout.ProfileId];
          
          //compare user's after unlock profile with before lock profile and to ensure that the user profile is restored.
          system.assertequals(userAftrUnLockoutprfl.Name , userBeforelkotprfl.Name);
        
          test.stopTest();
    
    
    }
    
    
    

}