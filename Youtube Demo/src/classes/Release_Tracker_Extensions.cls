public with sharing class Release_Tracker_Extensions{
     Release_Tracker__c rel;
     
    public List<SelectOption> selectedProfiles { get; set; }

    public  List<SelectOption> allProfiles { get; set; }


    public Release_Tracker_Extensions(ApexPages.StandardController controller) {
       this.rel = (Release_Tracker__c)controller.getRecord();
        Set<string> prevSelectedProfiles = new Set<string>(); 
        selectedProfiles = new List<SelectOption>();
        allProfiles = new List<SelectOption>();
        
      
        List<Profile> profiles= [SELECT Name, Id FROM Profile WHERE Name NOT IN('System Administrator','UserLockOut')];   
        
       if ( !String.Isempty(this.rel.profiles_to_lock__c))
           prevSelectedProfiles.addall(this.rel.profiles_to_lock__c.split(';'));
        
        for ( Profile p : profiles) {
        
            if(!prevSelectedProfiles.contains(p.Id) )    
                allProfiles.add(new SelectOption(p.Id, p.Name));
            else
                 selectedProfiles.add(new SelectOption(p.Id, p.Name));
        }
    }
    
    
     public PageReference save() {
      
       this.rel.profiles_to_lock__c= '';
       if(!selectedProfiles.isEmpty()) {     
         
         for ( SelectOption o:selectedProfiles)
         { 
           if (o.getValue() !=null)
           this.rel.profiles_to_lock__c += o.getValue() + ';';
         }
       }
        upsert rel;  
        return  new PageReference('/a05/o');
    }


   
      
    

}