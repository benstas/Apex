@RestResource(UrlMapping='/cases/*')
global class PostCaseProviderManagerMapping {

    // CaseProviderManager.postCaseProviderMapping('Yeni Case','Web');
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases
    @HttpPost
    global static Case postCaseProviderMapping(String Subject, String Origin){
        // Postman GoRest için Param, Body form-dataile veri gönderir. 
        // Postman Salesforce için Body Raw ile veri gönderir. POST -> Body -> Raw
        // Raw Json verileri içinde parametreden gelen veriler bulunmalıdır. 
        // Postman request contact-type, response contact-type ile aynı olmalıdır. 
        // https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_restrequest.htm        
        Case newCase = new Case();
            newCase.Subject = Subject; 
            newCase.Status = 'New'; 
            newCase.Priority = 'Low'; 
        	newCase.Origin = Origin; 
        	// Mapping için gelen değişken ile fieldname aynı olmalıdır. 
        	// Kasi durumda Container kullanılır. (CaseContainer)
        insert NewCase;
        /*
         {
            "Subject": "New Case",
            "Origin": "Phone"        
        }
		*/
        return newCase; 
        // Case:{Subject=Yeni Case, Status=New, Priority=Low, Origin=Web}
    }
}


