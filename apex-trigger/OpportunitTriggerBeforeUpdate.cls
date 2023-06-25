trigger OpportunitTriggerBeforeUpdate on Opportunity (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
        
        WHEN BEFORE_UPDATE  { 
            
            for(Opportunity newOpp : Trigger.new) {
                
                if(newOpp.Amount < 0) {
                    newOpp.Amount.addError('Amount can not been negative value!'); 
                } 
                else if(newOpp.Amount < 10000) {
                    newOpp.Description = 'Düşük değerli Opp'; 
                } 
                else if(newOpp.Amount > 10000 && newOpp.Amount < 20000) {
                    newOpp.Description = 'Orta değerli Opp'; 
                }
                 else {
                    newOpp.Description = 'Yüksek değerli Opp'; 
                }
            }
        }
        
 
    } 
}