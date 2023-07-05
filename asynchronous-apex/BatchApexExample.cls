public class BatchApexExample implements Database.Batchable<sObject> {
	// implement ile batch apex class oldu <sObject> kısmına istenirse object ismi yazılabilir. 	
	
	public Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute         
        String query = 'SELECT Id, Name, BillingCountry FROM Account'; 
        // 3 farklı query yöntemi var. İhtiyaç olan fieldlar getirilir. 
        return Database.getQueryLocator(query);
    }
     
    public void execute(Database.BatchableContext BC, List<Account> accList) {
        
        // process each batch of records default size is 200
        for(Account acc : accList) {        
            // Update the Account Name 
            acc.Name = acc.Name + ' ms';
            acc.BillingCountry = 'Turkey'; 
        }
        
        try {
            // Update the Account Record
            update accList;
         
        } 
        catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    public void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}
/*
    BatchApexExample myBatchObject = new BatchApexExample(); 
    Database.executeBatch(myBatchObject);
*/