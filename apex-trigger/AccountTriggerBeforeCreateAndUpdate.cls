trigger AccountTriggerBeforeCreateAndUpdate on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
            /*
             Before creating an Account if the industry field is null assign ‘Banking’ to Industry field
            -> Account
            -> before -> insert
            -> industry == null -> industry = ‘Banking’
             */
            for(Account acc : Trigger.new) {
                if(acc.Industry == null) {
                    acc.Industry = 'Banking'; 
                }
            }
        }
        
        WHEN BEFORE_UPDATE  { 
            /*
             Before updating an Account assign ‘Education’ to Industry field
            -> Account
            -> before -> update
            -> industry = ‘Education’
             */
        	for(Account acc : Trigger.new) {
                acc.Industry = 'Education'; 
            }
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
    }

}