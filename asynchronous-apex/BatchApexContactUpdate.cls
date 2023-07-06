public class BatchApexContactUpdate implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext BC) {
              
    	String query = 'SELECT BillingCity, BillingCountry, BillingState, Id, (SELECT Id, MailingCity, MailingCountry, MailingState FROM Contacts) FROM Account';         
        return Database.getQueryLocator(query);
        
        /*
        String query1 = 'SELECT BillingCity, BillingCountry, BillingState, Id FROM Account WHERE Name LIKE \'AAA%\' ';         
        return Database.getQueryLocator(query);
		
		String name = 'AAA%';
		String query2 = 'SELECT BillingCity, BillingCountry, BillingState, Id FROM Account WHERE Name LIKE ' + name + ' ';         
        return Database.getQueryLocator(query);
        
        return Database.getQueryLocator([SELECT BillingCity, BillingCountry, BillingState, Id FROM Account WHERE Name LIKE 'AAA%']);
        */
    }
    
    public void execute(Database.BatchableContext BC, List<Account> accList) {
        
        List<Contact> cntList = new List<Contact>();
            
        for(Account acc : accList) {       
            
           for(Contact cnt : acc.Contacts) {  
               
               cnt.MailingCity = acc.BillingCity;
               cnt.MailingCountry = acc.BillingCountry;
               cnt.MailingState = acc.BillingState;
               
               cntList.add(cnt);
        	}
        }
        
        try {
            update cntList;
         
        } 
        catch(Exception e) {
            System.debug(e);
        }
         
    } 
    
  	public void finish(Database.BatchableContext BC) {
        System.debug('Batch apex is finished');
    }
}
/*
BatchApexContactUpdate batch = new BatchApexContactUpdate(); 
Database.executeBatch(batch);
*/









