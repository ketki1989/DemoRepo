trigger createcaseRecord on Opportunity (after insert,after update) {
    List<Case> listcase = new List<Case>();
    for(Opportunity o: Trigger.new)
    {
        if(o.StageName == 'Closed Won' &&( Trigger.isInsert || (Trigger.Isupdate && Trigger.oldMap.get(o.id).StageName !=o.StageName)))
        {
            listcase.add(new case(
                Subject = o.Name,
                AccountId=o.AccountId,
                Priority = 'Medium',
                Status = 'New'));
        }
        if(listcase.size()>0)
        {
            insert listcase;
        }
    }


}