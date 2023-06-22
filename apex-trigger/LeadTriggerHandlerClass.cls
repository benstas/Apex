public class LeadTriggerHandler {
    
    public static void industryNotNull (List<Lead> Leads) {
        
			for(Lead newLead : Leads) {
                	  if (newLead.Industry == null) {
                    // newLead.addError('Industry boş olmaz..'); 
                    newLead.Industry.addError('Industry boş olmaz..'); 
                }
            }
        }
}
