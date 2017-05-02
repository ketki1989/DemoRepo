trigger totalAmountTrg on Opportunity (after insert,after update) {
    if(Trigger.Isupdate)
    {
        List<Opportunity> op=trigger.New;
    
    
    }
}