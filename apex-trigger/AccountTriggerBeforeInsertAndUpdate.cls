trigger AccountTriggerBeforeInsertAndUpdate on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
 
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
            
            Set<Id> idList = new Set<Id>(); 
            
        	for(Account newAcc : Trigger.new) {
                idList.add(newAcc.OwnerId); 
            }
            
            Map<Id, User> userMap = new Map<Id, User>([SELECT Id, Name FROM User WHERE Id = :idList]); 
            
            for(Account acc : trigger.new) {
                acc.Sales_Repr__c = userMap.get(acc.OwnerId).Name; 
            }
        }
        
         WHEN BEFORE_UPDATE  { 
            /*
            for(Account newAcc : Trigger.new) {
                User user = [SELECT Id, Name FROM User WHERE User.Id = :newAcc.OwnerId]; 
                newAcc.Sales_Repr__c = user.Name; 
            }
			*/
             Set<Id> ownerIds = new Set<Id>();              
                 
             for(Account newAcc : Trigger.new) {
                 //User user = [SELECT Id, Name FROM User WHERE Id = :newAcc.OwnerId];
                 //newAcc.Sales_Repr__c = user.Name;
                 ownerIds.add(newAcc.OwnerId);
             }
			
             User user = [SELECT Id, Name FROM User WHERE Id = :ownerIds];
             // System.debug(User.Name);
                 
             for(Account newAcc : Trigger.new) {
                 newAcc.Sales_Repr__c = user.Name; 
             }
             
        }
    }
}