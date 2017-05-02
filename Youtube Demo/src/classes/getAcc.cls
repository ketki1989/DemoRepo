public with sharing class getAcc {
	
	public List<Account> getAcc(){
		return [SELECT Name,ID from Account];
	}
    
}