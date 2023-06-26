trigger AccountTriggerAfterInsertThreeContacts on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
  
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
            delete [SELECT Id FROM Case]; 
        	List<Contact> cons = [SELECT Id FROM Contact]; 
            delete cons; 
            
        }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { 
        	
            List<Contact> conList = new List<Contact>(); 
            
            for(Account newAcc : Trigger.new) {
                
                Contact con1 = new Contact(LastName = 'Lother', FirstName = 'Mateus', AccountId = newAcc.Id);
                Contact con2 = new Contact(LastName = 'Hasenbeng', FirstName = 'Jimmy Flay', AccountId = newAcc.Id);
                Contact con3 = new Contact(LastName = 'Totti', FirstName = 'Francesco', AccountId = newAcc.Id);                 
                
                conList.add(con1); 
                conList.add(con2); 
                conList.add(con3); 
            }
            insert conList; 
        }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}