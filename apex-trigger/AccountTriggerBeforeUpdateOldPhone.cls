trigger AccountTriggerBeforeUpdateOldPhone on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
    
    WHEN BEFORE_INSERT  { }
    WHEN BEFORE_UPDATE  { 
        
        for(Account newAcc : Trigger.new) {
            Account oldAcc = Trigger.oldMap.get(newAcc.Id); 
                                             
            if(newAcc.Phone != oldAcc.Phone) {
                newAcc.Old_Phone__c = oldAcc.Old_Phone__c + oldAcc.Phone; 
            }
        }
    }

}
}