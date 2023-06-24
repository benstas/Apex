trigger LeadTriggerBeforeUpdateValidation on Lead (before insert, before update , before delete , after insert , after update, after delete, after undelete) {
	
	SWITCH on Trigger.operationType {
        
		WHEN BEFORE_UPDATE { 
            /*
             Q: Create an error trigger when a lead is updated from ‘Open – Not Contacted’ status
                to ‘Closed - Corverted’ or ‘Closed – Not Corverted’ status Validation 
                Lead Trigger -> before update
             */
            
			LeadTriggerHandler.statusCheck(Trigger.new, Trigger.oldMap);             
        }
 	}
}