public class BatchApexStateful implements Database.Batchable<sObject> , Database.Stateful {
    
    Integer recordUpdated = 0; 
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
              
    	String query = 'SELECT BillingCity, BillingCountry, BillingState, Id, (SELECT Id, MailingCity, MailingCountry, MailingState FROM Contacts) FROM Account';         
        return Database.getQueryLocator(query);  
    }
    
    public void execute(Database.BatchableContext BC, List<Account> accList) {
        
        List<Contact> cntList = new List<Contact>();
            
        for(Account acc : accList) {       
            
           for(Contact cnt : acc.Contacts) {  
               
               recordUpdated+=1;
               
               cnt.MailingCity = acc.BillingCity;
               cnt.MailingCountry = acc.BillingCountry;
               cnt.MailingState = acc.BillingState;
               
               cnt.Guncelleme_Sirasi__c = recordUpdated; 
               
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