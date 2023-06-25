trigger AccountTriggerAfterUpdateWithOpp2 on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
   
    SWITCH on Trigger.operationType {
        
        WHEN AFTER_UPDATE   { 
            
            for(Account newAcc : Trigger.new) {
                
                List<Opportunity> oppList = [SELECT Id, Name, Amount FROM Opportunity WHERE AccountId = :newAcc.Id]; 
               
				List<Opportunity> newOppList = new List<Opportunity>();
                 
                for(Opportunity opp : oppList) {
                   
                    if(opp.Amount < 12000) {
                        opp.Amount = 12000; 
                    }else {
                        opp.Amount = opp.Amount + 1000;                         
                    }
                    newOppList.add(opp); 
                }
                update oppList; 
                
            }
        }
 
    }

}