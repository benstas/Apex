trigger CaseTrigger on Case (after update) {
	
    for(Case newCase : Trigger.new) {
        Case oldCase = Trigger.oldMap.get(newCase.Id); 
        
        if(newCase.Gonder__c != oldCase.Gonder__c && newCase.Gonder__c == true){
            
            CaseClientCallout.postCaseTrigger(newCase.Id); 
        }
    }
}
