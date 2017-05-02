public class ReleaseWindowConfigController1 {

    public boolean editSection {get;set;}
    public List<Release_Window_Config__c> lstReleaseWindow{get;set;}
    
    public ReleaseWindowConfigController1() {
        ReleaseWindow();
        
    }

  
    public PageReference EdittheSection()
    {
        editSection = true;
        return null;
    }
    
    
    public pagereference saveme()
    {
        try
        {
           update lstReleaseWindow;
           editSection = false;
        }
        catch(Exception e)
        {
            System.debug('Exception occurred '+String.valueOf(e));
        }
        return NULL;
    }
    
    
    public pagereference cancelme()
    {
        editSection = false;
        ReleaseWindow();
        return  null;
    }
    
    
    void ReleaseWindow(){
        lstReleaseWindow =[SELECT Release_End_Date__c,Release_Start_Date__c,UserLockoutStatus__c FROM  Release_Window_Config__c];
    }    


}