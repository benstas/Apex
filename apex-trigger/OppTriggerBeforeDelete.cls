trigger OppTriggerBeforeDelete on Opportunity (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
    
    WHEN BEFORE_INSERT  { }
    WHEN BEFORE_UPDATE  { }
    WHEN BEFORE_DELETE  { 
        for(Opportunity oldOpp : Trigger.old) {
            
            if (oldOpp.StageName == 'Closed Won') {
                oldOpp.StageName.addError('Hey bro! Opp can not be deleted if Stage is Closed Won'); 
            }
        }
    }
    WHEN AFTER_INSERT   { }
    WHEN AFTER_UPDATE   { }
    WHEN AFTER_DELETE   { }
    WHEN AFTER_UNDELETE { }

}
}