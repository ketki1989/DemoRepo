public with sharing class MultiselectExampleController {

    public SelectOption[] selectedProfiles { get; set; }

    public  SelectOption[] allProfiles { get; set; }

    
    public String message { get; set; }
    
    public MultiselectExampleController() {
        selectedProfiles = new List<SelectOption>();
        
        List<Profile> profiles= [SELECT Name, Id FROM Profile];    
        allProfiles = new List<SelectOption>();
        for ( Profile p : profiles) {
            allProfiles.add(new SelectOption(p.Id, p.Name));
        }
    }

    public PageReference save() {
        message = 'Selected Profiles: ';
        Boolean first = true;
        for ( SelectOption so : selectedProfiles ) {
            if (!first) {
                message += ', ';
            }
            message += so.getLabel() + ' (' + so.getValue() + ')';
            first = false;
        }
        
        return null;       
    }
}