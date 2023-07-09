trigger AccountTriggerReview on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_DELETE  { 
        	// Bir accountun bağlı opportunityleri varsa o accountun silinmesine engel olalım ve userı uyaralım. 
        	// Account -> before delete // silmeden önce
        	// Trigger.old
            for(Account oldAcc : Trigger.old) {
                
                List<Opportunity> listOpp = [SELECT Id FROM Opportunity WHERE AccountId = :oldAcc.Id]; 
                
                if(listOpp.size() > 0) {
                    oldAcc.addError('Account have opportunities so you dont delete! '); 
                }
            }
        }
        
        WHEN AFTER_UNDELETE { 
        	// Undelete yapılan Account recordun descriptionuna herhangi bir değer atayın. 
        	// Account -> after undelete
        	List<Account> newList = [SELECT Id, Name, Description FROM Account WHERE Id = :Trigger.newMap.keyset()]; 
            
        	List<Account> accList = new List<Account>(); 
            
            for(Account newAcc : newList) { 
            	newAcc.Description = 'Bu account çöpten geldi.'; 
                accList.add(newAcc); 
            }
            
            update accList; 
        }
 
    }
}
  
