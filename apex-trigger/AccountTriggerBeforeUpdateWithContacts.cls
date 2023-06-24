trigger AccountTriggerBeforeUpdateWithContacts on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        
        WHEN BEFORE_UPDATE  { 
        	
            for(Account newAcc : Trigger.new) {
                Account oldAcc = Trigger.oldMap.get(newAcc.Id);
                
                if(oldAcc.BillingCity != newAcc.BillingCity) {
                    List<Contact> contacts = [SELECT Id, Name, MailingCity FROM Contact WHERE AccountId = :newAcc.Id]; 
                    
                    List<Contact> conList = new List<Contact>();
                    
                    for(Contact con : contacts) {    
                        System.debug(con.MailingCity + ' - ' +oldAcc.BillingCity);
                        con.MailingCity = oldAcc.BillingCity; 
                        conList.add(con); 
                    }
                    update conList;
                }                                                                                        
            }
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
    
}