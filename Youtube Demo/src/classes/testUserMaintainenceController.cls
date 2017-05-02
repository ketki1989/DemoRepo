@isTest
public class testUserMaintainenceController{

    static testMethod void testUsrMaintCtrlMethod()
    {
      UserMaintenanceController controller;
      // This code runs as the system user
       Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
      
       Region__c region = new Region__c (
       Support_Phone__c='9991299912',
       Support_Email__c ='supportjci@jci.com',
       Name='NA');
       insert region;
      

       User u = new User(Alias = 'standt',
       Email='std@jci.in', 
       EmailEncodingKey='UTF-8',
       LastName='Testing',
       LanguageLocaleKey='en_US', 
       LocaleSidKey='en_US',
       ProfileId = p.Id, 
       TimeZoneSidKey='America/Los_Angeles', 
       UserName='std@jci.in',
       Region__c='NA');
       insert u;
      
      
       Release_Window_Config__c relwinCfg = new Release_Window_Config__c (
       Release_Start_Date__c = Datetime.Now(),Release_End_Date__c = Datetime.Now() , UserLockoutStatus__c = 'Lock') ;
       insert relwinCfg  ;
      
       string cntrlLocal = '';
       string cntrlPhone = '';
       string cntrolEmail = '';
       
       System.runAs(u) {
          // The following code runs as user 'u' 
          //System.debug('Current User: ' + UserInfo.getUserName());
          //System.debug('Current Profile: ' + UserInfo.getProfileId());
         
            controller = new UserMaintenanceController();
            cntrlLocal  = controller.getLocale();
             cntrlPhone = controller.getPhone();
           cntrolEmail = controller.getEmail();
         
            
           
      }
            system.assertequals(u.LocaleSidKey,cntrlLocal  );
            system.assertequals(region.Support_Phone__c,cntrlPhone );
            system.assertequals(region.Support_Email__c ,cntrolEmail );
           
      
     }
}