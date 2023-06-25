trigger OpportunityAfterInsertRecursion on Opportunity (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
   
    SWITCH on Trigger.operationType {
        
        WHEN AFTER_INSERT   { 
            
            OpportunityAfterInsertRecursionHandler.addOpp(Trigger.new); 
        }
 
    }
}