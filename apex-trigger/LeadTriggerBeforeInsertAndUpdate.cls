trigger LeadTriggerBeforeInsertAndUpdate on Lead (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    SWITCH on Trigger.operationType 
    	{
        WHEN BEFORE_INSERT  { 
            // When a new Lead is created assign ‘Education’ if Industry field null
            for(Lead newLead : Trigger.new) {
                if(newLead.Industry == null) {
                    // String.isBlank(newLead.Industry)
                    newLead.Industry = 'Education';
                }
            }
        }
        
        WHEN BEFORE_UPDATE  { 
            // If Lead is updated, assign ‘Banking’ If Industry field null
         	for(Lead newLead : Trigger.new) {
                if(newLead.Industry == null) {
                    // String.isBlank(newLead.Industry)
                   newLead.Industry = 'Banking';
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
