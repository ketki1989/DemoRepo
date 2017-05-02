//Batch Job for Processing user Records
global class UpdateUserRecordsBatch implements Database.Batchable<sobject>{  
 
  //Start Method
  global Database.Querylocator start (Database.BatchableContext BC) {
    return Database.getQueryLocator('Select id, Name, ProfileID  From User WHERE Profile.Name != "System Administrator"');//Query which will be determine the scope of Records fetching the same
  }

  //Execute method
  global void execute (Database.BatchableContext BC, List<User> scope) {
    List<User> userToUpdate = (List<User>)scope ;
    Database.update(userToUpdate );
  
  
  }

  //Finish Method
  global void finish(Database.BatchableContext BC){
      
  }

  //Scheduler Method to scedule the class
  global void execute(SchedulableContext sc)
    {
       
    }
}