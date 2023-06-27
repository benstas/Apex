trigger AccountTriggerBeforeUpdateWithContacts on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
                
        WHEN BEFORE_UPDATE  { 
            
            Set<Id> accs = new Set<Id>(); 
        	
            for(Account newAcc : Trigger.new) {
                Account oldAcc = Trigger.oldMap.get(newAcc.Id);
                
                if(oldAcc.BillingCity != newAcc.BillingCity) {
                    accs.add(oldAcc.Id);
                 
                }                                                                                        
            }
            
            
            List<Contact> contacts = new List<Contact>();
             
            if(accs.size() > 0) {                
                contacts = [SELECT Id, Name, AccountId, MailingCity, Account.BillingCity FROM Contact WHERE AccountId = :accs];                                     
            } 
            
            		List<Contact> conList = new List<Contact>(); 

                    for(Contact con : contacts) {    
                        con.MailingCity = con.Account.BillingCity; 
                        conList.add(con); 
                    }
                    update conList;
            
        }
 
    }
    
}