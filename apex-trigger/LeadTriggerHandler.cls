trigger LeadTriggerHandler on Lead (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    //If a new Lead is created or updated and if ‘Industry’ filed is null; Give a warning. (Before) 

SWITCH on Trigger.operationType {
   
   WHEN BEFORE_INSERT  { 
       /*
       for(Lead newLead : Trigger.new) {
           if (newLead.Industry == null) {
               // newLead.addError('Industry boş olmaz..'); 
               newLead.Industry.addError('Industry boş olmaz..'); 
           }
       }
       */
       LeadTriggerHandler.industryNotNull(Trigger.new);
   }
    
   WHEN BEFORE_UPDATE  { 
       /*
       for(Lead newLead : Trigger.new) {
           if (String.isBlank(newLead.Industry)) {
               // newLead.addError('Industry boş olmaz..'); 
               newLead.Industry.addError('Industry boş olmaz..'); 
           }
       }
       */
       LeadTriggerHandler.industryNotNull(Trigger.new);
   }
    
   WHEN BEFORE_DELETE  { }
   WHEN AFTER_INSERT   { }
   WHEN AFTER_UPDATE   { }
   WHEN AFTER_DELETE   { }
   WHEN AFTER_UNDELETE { }

}
}