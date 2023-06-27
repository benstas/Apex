trigger ContactTriggerAllEventss on Contact (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
  
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        
        WHEN AFTER_INSERT   { 
            // Number_Of_Contacts__c
            Set<Id> conIds = new Set<Id>();      
                                  
            for(Contact newCon : Trigger.new) {
				
                if(newCon.AccountId != null) {
                    conIds.add(newCon.AccountId);
                }
               
            }
            
            List<Account> accs = new List<Account>();
            
            if (conIds.size() > 0) {
                accs = [SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id = :conIds]; 
                
                List<Account> accList = new List<Account>();
                    
                for(Account acc : accs) {
                    acc.Number_Of_Contacts__c = String.valueOf(acc.Contacts.size());
                    accList.add(acc);
                }
                
                update accList;

            }
            
                                 
        }
        
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}