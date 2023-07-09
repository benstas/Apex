public class BatchApexWithLead implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        /*
        String query = 'SELECT Id, LeadSource FROM Lead WHERE LeadSource = null'; 
        return Database.getQueryLocator(query);
        */
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead WHERE LeadSource = null]);
    }
    
    
    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        
        if(leads.size() > 0) {
             
            List<Lead> leadList = new List<Lead>(); 
            
                for(Lead l : leads) {
                    
                    l.LeadSource = 'Other'; 
                    
                    leadList.add(l);
                } 
            
            try{
                update leadList;  
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
/*
BatchApexWithLead myBatchObject = new BatchApexWithLead(); 
Database.executeBatch(myBatchObject);
Id batchId = Database.executeBatch(myBatchObject, 100);
*/