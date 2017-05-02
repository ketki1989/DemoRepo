public class UserMaintenanceController {

    public Region__c region{get;set;}
     public Release_Window_Config__c releaseWindow{get;set;}
    
    public UserMaintenanceController(){
        setRegion();
        setMaintenance();
    }
    
    void setRegion(){
           User u= [SELECT Region__c FROM User where Id=:UserInfo.getuserid()];
           region = [SELECT Support_Phone__c,Support_Email__c FROM  Region__c WHERE Name = :u.Region__c];           
    }
    void setMaintenance(){
           releaseWindow =[SELECT Release_Start_Date__c,Release_End_Date__c FROM Release_Window_Config__c];
    }
    public String getLocale() {
        return UserInfo.getlocale();
    }
     public string getPhone(){
     return region.Support_Phone__c;
    }
    
     public string getEmail(){
     return region.Support_Email__c;
    }
    
     public string getMaintainenceStartDate() {
          
            return releaseWindow.Release_Start_Date__c.format();
    }  
    
    public string getMaintainenceEndDate() {
           //return m.End_Date__c.format('EEEE, MMMM d, yyyy h:mm a z');
            return releaseWindow.Release_End_Date__c.format();
    } 
    
    
    
}