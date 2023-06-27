trigger AccountTriggerBeforeInsertBillingShippingCity on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
	
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
        	
            for(Account newAcc : Trigger.new) {
                if(newAcc.BillingCity != null && newAcc.ShippingCity == null) {
                    newAcc.ShippingCity = newAcc.BillingCity; 
                }
            }
        }
 
    }
}
