@RestResource(UrlMapping='/cases/*')
global class PatchCaseProviderManager {

    // CaseProviderManager.patchCaseProviderMapping();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases/id
    @HttpPatch
    global static Case patchCaseProviderMapping(){        
        // Postman GoRest için / Param ile siler. 
        // Postman Salesforce için / Param ile siler.
        // Postman request contact-type, response contact-type ile aynı olmalıdır. 
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        // cases/id ile gelen Id alınır. 
        Case updatedCase = [SELECT Id, Subject FROM Case WHERE Id = :caseId];
        // Case:{Id=5008d00000W3a5AAAR, Subject=Put Case}
        /*
        {
			"Id": "5008d00000W3a5AAAR",
            "Subject": "Put Case",
            "Origin": "Web"        
        }
		*/ 
		Map<String,Object> gelenJson = (Map<String,Object>) JSON.deserializeUntyped(req.requestBody.toString());  
        // {Id=5008d00000W3a5AAAR, Origin=Web, Subject=Put Case}
       
        for(String fieldName : gelenJson.keySet()) {
            updatedCase.put(fieldName, gelenJson.get(fieldName)); 
        }
        update updatedCase; 
        
        return updatedCase;
    }
}