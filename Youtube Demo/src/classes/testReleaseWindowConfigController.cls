@isTest
public class testReleaseWindowConfigController{

static testMethod void testControllerMethod(){
    //create test release Window object and add to list
    Release_Window_Config__c releaseWindow=new Release_Window_Config__c();
    releaseWindow.Release_Start_Date__c=DateTime.Now();
    releaseWindow.Release_End_Date__c =DateTime.Now().addDays(1);
    releaseWindow.UserLockoutStatus__c='Lock';
    

    List<Release_Window_Config__c> lstReleaseWindow= new List<Release_Window_Config__c>();
    lstReleaseWindow.add(releaseWindow);
    
    string ctrlReleaseWindow='';
    
    //initialize controller
    ReleaseWindowConfigController cntrl=new ReleaseWindowConfigController();
   
    
    
    
    


}

}