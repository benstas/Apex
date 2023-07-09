public class BatchApexWithHasta implements Database.Batchable<sObject> {
    
	public Database.QueryLocator start(Database.BatchableContext bc) {
        /*
        String query = 'SELECT Id, Name, Doctor_Name__c, Nurse_Name__c FROM Hasta__c'; 
        return Database.getQueryLocator(query);
        */
        return Database.getQueryLocator([SELECT Id, Name, Doctor_Name__c, Nurse_Name__c FROM Hasta__c]);
    }    
    
    
    public void execute(Database.BatchableContext bc, List<Hasta__c> hastalar) {
        
        List<Hasta__Share> hastaList = new List<Hasta__Share>(); 
            
        for(Hasta__c hasta : hastalar) {
            
             Hasta__Share h = new Hasta__Share();
            
             h.ParentId = hasta.Id; 
             h.UserOrGroupId = hasta.Doctor_Name__c; 
             h.AccessLevel = 'edit'; 
             h.RowCause = 'Manual'; 
            
            hastaList.add(h); 
            
            Hasta__Share hs = new Hasta__Share();
            
             hs.ParentId = hasta.Id; 
             hs.UserOrGroupId = hasta.Nurse_Name__c; 
             hs.AccessLevel = 'edit'; 
             hs.RowCause = 'Manual'; 
            
            hastaList.add(hs); 
        }
        
        insert hastaList; 
    }
    
    
    public void finish(Database.BatchableContext bc) {
        System.debug('Process is completed');
    }

}

/*
BatchApexWithHasta myBatchObject = new BatchApexWithHasta(); 
Database.executeBatch(myBatchObject);
Id batchId = Database.executeBatch(myBatchObject, 100);
*/
