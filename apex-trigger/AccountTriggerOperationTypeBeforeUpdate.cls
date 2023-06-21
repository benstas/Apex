trigger AccountTriggerOperationTypeBeforeUpdate on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    SWITCH on Trigger.operationType 
{
    WHEN BEFORE_INSERT  { }
    
    WHEN BEFORE_UPDATE  { 
        /*
        for(Account newAcc : Trigger.new){
            for(Account oldAcc : Trigger.old) {
                if(newAcc.Rating != oldAcc.Rating) {
                    newAcc.Industry = 'Education'; 
                }
            }
        }
        */
        for(Account newAcc : Trigger.new){ 
            Account oldAcc = Trigger.oldMap.get(newAcc.Id);      
            
            if(newAcc.Rating != oldAcc.Rating) {
                    newAcc.Industry = 'Education'; 
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