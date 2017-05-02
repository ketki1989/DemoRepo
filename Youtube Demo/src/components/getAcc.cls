public with sharing class getAcc {
	
	public List<Account> getAcc(){
		return [SELECT Name,ID,email from Account];
	}
    
}