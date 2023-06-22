trigger LeadTriggerUndelete on Lead (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
	
    // When a lead record is restored from a recycle bin, type ‘restored’ in the console  
	
    SWITCH on Trigger.operationType {
        
		WHEN AFTER_UNDELETE   { 
            for(Lead newLead : trigger.new) {
                System.debug(newLead.Id + ' ID record restored');
                // 00Q8d00000GUKh6EAH
                // 00Q8d00000GUKh6EAH ID record restored
                
                // newLead.Description = 'Restored..'; 
                // After ile kendi read-only olur. Bu sebeple değişimez. 
            }
        }
    }
    
}