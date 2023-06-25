trigger AccountTriggerAfterInsertWithOpp on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
       
        WHEN AFTER_INSERT   { 
            
            List<Opportunity> oppList = new List<Opportunity>(); 
            
            for(Account newAcc : Trigger.new) {
                
                Opportunity opp = new Opportunity(); 
                
                opp.Name = 'Deneme Opp 1'; 
                opp.CloseDate = System.today(); 
                opp.StageName = 'Prospecting'; 
                
                opp.AccountId = newAcc.Id; 
                
                oppList.add(opp); 
            }
            
            insert oppList; 
        }
         
    }
}