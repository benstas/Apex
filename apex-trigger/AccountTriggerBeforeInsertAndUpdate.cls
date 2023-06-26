trigger AccountTriggerBeforeInsertAndUpdate on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
 
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
        	
            for(Account newAcc : Trigger.new) {
                User user = [SELECT Id, Name FROM User WHERE User.Id = :newAcc.OwnerId]; 
                newAcc.Sales_Repr__c = user.Name; 
            }
        }
        WHEN BEFORE_UPDATE  { 
            
            for(Account newAcc : Trigger.new) {
                User user = [SELECT Id, Name FROM User WHERE User.Id = :newAcc.OwnerId]; 
                newAcc.Sales_Repr__c = user.Name; 
            }
        }
 
    }
}