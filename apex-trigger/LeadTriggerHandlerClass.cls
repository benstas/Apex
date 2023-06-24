public class LeadTriggerHandler {
    
    public static void industryNotNull (List<Lead> Leads) {
        
			for(Lead newLead : Leads) {
                	  if (newLead.Industry == null) {
                    // newLead.addError('Industry boş olmaz..'); 
                    newLead.Industry.addError('Industry boş olmaz..'); 
                }
            }
        }


        public static void statusCheck(List<Lead> newLeads, Map<Id, Lead> oldMaps) {
        
			for (Lead newLead : newLeads) {
                
                Lead oldLead = oldMaps.get(newLead.Id);
                
                if (newLead.Status != 'Working - Contacted' && oldLead.Status == 'Open - Not Contacted') {
                    newLead.Status.addError('You should do Working before!!!'); 
                }
            }
        }
}
