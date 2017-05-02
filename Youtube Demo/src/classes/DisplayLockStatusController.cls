public class DisplayLockStatusController {
  
   public string DisplayCurrentDate{get;set;}
   public string OutputSomeDate{get;set;}
   public DisplayLockStatusController() {
   DisplayCurrentDate= String.ValueOfGMT(system.now());
   string somestring=DisplayCurrentDate;
  // string tempdt=String.ValueOfGMT(somestring);
   //OutputSomeDate= String.ValueOf( [SELECT LastActivityDate,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate FROM Release_Tracker__c where 
         //                              ID ='a0541000007jYYT' and 
      //                                 LastModifiedDate=:Datetime.parse(tempdt) ][0].LastModifiedDate);
  }

}