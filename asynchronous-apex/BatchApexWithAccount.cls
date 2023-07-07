public class BatchApexWithAccount implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
         
        return Database.getQueryLocator([SELECT id, Name FROM Account WHERE  Name LIKE '%AAA%']);
    }
    
    
    public void execute(Database.BatchableContext bc, List<Account> accList) {
        
        if(accList.size() > 0) {
             
            try{
                delete accList;
            }
             catch(Exception e ){
                system.debug(' exception -->> ' + e.getMessage());
            }      
             
         }
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Process is completed');
    }
}

