public with sharing class Release_Window_Config_C_Extensions {

    Release_Window_Config__c rel ;
    ApexPages.StandardSetController controller ;
    
    public SelectOption[] selectedProfiles { get; set; }

    public  SelectOption[] allProfiles { get; set; }

    
   
    public Release_Window_Config_C_Extensions(ApexPages.StandardSetController controller) {
    this.rel = (Release_Window_Config__c)controller.getRecord();
    
    this.controller = controller;
        selectedProfiles = new List<SelectOption>();
        
        List<Profile> profiles= [SELECT Name, Id FROM Profile];    
        allProfiles = new List<SelectOption>();
        for ( Profile p : profiles) {
            allProfiles.add(new SelectOption(p.Id, p.Name));
        }
        
     

    }
    
    public PageReference quickSave()
    {
    
     system.debug( 'pritesh1'+ this.rel.profiles_to_lock__c);
      if(!selectedProfiles.isEmpty()) {     
         
         for ( SelectOption o:selectedProfiles)
         {   
          
         if (o.getValue() !=null)
          this.rel.profiles_to_lock__c += o.getValue() + ';';
         
         }
         
         }
         system.debug( 'pritesh'+ this.rel.profiles_to_lock__c);
           system.debug( 'priteshID'+ this.rel.ID);
         
        insert rel;
        //this.controller.Save();
        return Apexpages.currentPage();
    }
    
    
    
    public PageReference Savelink()
    {
    
     system.debug( 'pritesh1'+ this.rel.profiles_to_lock__c);
      if(!selectedProfiles.isEmpty()) {     
         
         for ( SelectOption o:selectedProfiles)
         {   
          
         if (o.getValue() !=null)
          this.rel.profiles_to_lock__c += o.getValue() + ';';
         
         }
         
         }
         system.debug( 'pritesh'+ this.rel.profiles_to_lock__c);
           system.debug( 'priteshID'+ this.rel.ID);
         
        insert rel;
        //this.controller.Save();
        return Apexpages.currentPage();
    }
    

}