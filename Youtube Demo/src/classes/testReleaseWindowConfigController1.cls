@isTest
public class testReleaseWindowConfigController1 {

    public static testMethod void testReleaseWindowConfigController1() {
           Release_Window_Config__c releaseWindow=new Release_Window_Config__c();
           releaseWindow.Release_Start_Date__c=DateTime.Now();
           releaseWindow.Release_End_Date__c=DateTime.Now().adddays(1);
           releaseWindow.UserLockoutStatus__c='unLock';
           
           insert releaseWindow;
           
           List<Release_Window_Config__c> lstRelWin =new List<Release_Window_Config__c>();
           lstRelWin.add(releaseWindow);
    
           ReleaseWindowConfigController1 controller=new ReleaseWindowConfigController1();
           controller.lstReleaseWindow=lstRelWin;
           controller.saveme();
           
           System.assertNotEquals(null, lstRelWin[0].UserLockoutStatus__c);
           
        
           }
}