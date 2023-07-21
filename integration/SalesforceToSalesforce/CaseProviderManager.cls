@RestResource(UrlMapping='/cases/*')
global class CaseProviderManager {
	// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_restrequest.htm 
    /*
	Setup -> Company Settings -> My Domain -> Current My Domain URL 
	System.debug(System.Url.getSalesforceBaseUrl());
	https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases

	Authorization 
	System.debug(System.UserInfo.getSessionId().substring(15));
	Bearer Toeken
	!AQMAQBtxcsV8CG2xjtOpAMMxQo6DCxWAJzcoyOMrMCN64Xb4VCpG3MrGmrd1Xlzfsnm65.zxWd2bR374JpbKclMKp9wskbXM
	*/
    
    
    
    //========================================================================
    
    
    
    // CaseProviderManager.getCaseProvider();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases  
    /*
    @HttpGet
    global static List<Case> getCaseProvider(){
        
       	List<case> caseList = [SELECT Type, Status, Reason, Origin, Subject, Priority FROM case Limit 5]; 
       	// (Case:{Status=New, Origin=Phone, Subject=Deneme Case, Priority=Medium, Id=5008d00000W3Y3WAAV})
       	// JSON.serialize(o) işini Salesforce yapar. 
    	return caseList;     
       
    }    
    */
    
    //-------------------------------------------------------------------------------------
    
    // CaseProviderManager.getCaseProviderSingle();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases/202020
    
    @HttpGet
    global static Case getCaseProviderSingle(){
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        // cases/id ile gelen Id alınır. 
        
        Case singleCase = [SELECT Type, Status, Reason, Origin, Subject, Priority FROM Case WHERE Id = :caseId];
        // Case:{Status=New, Origin=Phone, Subject=Put Case, Priority=Low, Id=5008d00000W3a5AAAR}
        return singleCase;  
    }  
    
    
    
    //========================================================================
    
    
    
    // CaseProviderManager.postCaseProviderMapping('Yeni Case','Web');
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases
    @HttpPost
    global static Case postCaseProviderMapping(String Subject, String Origin){
        // Postman GoRest için Param, Body form-dataile veri gönderir. 
        // Postman Salesforce için Body Raw ile veri gönderir. POST -> Body -> Raw
        // Raw Json verileri içinde parametreden gelen veriler bulunmalıdır. 
        // Postman request contact-type, response contact-type ile aynı olmalıdır.                
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
    
    
  
    //========================================================================
    
    
    
    // CaseProviderManager.deleteCaseProvider();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases/202020
    @HttpDelete
    global static String deleteCaseProvider(){
        // Postman GoRest için / Param ile siler. 
        // Postman Salesforce için / Param ile siler.
        // Postman request contact-type, response contact-type ile aynı olmalıdır. 
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String caseId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        // cases/id ile gelen Id alınır. 
        Case deletedCase = [SELECT Id, Subject FROM Case WHERE Id = :caseId];
        // Case:{Id=5008d00000W3Y3WAAV, Subject=Deneme Case}
        delete deletedCase; 
        
        return deletedCase.Id + ' değer sahip record silindi..';
    }
    
    
    
     //========================================================================
    
    
    
    // CaseProviderManager.putCaseProviderMapping();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases
    @HttpPut
    global static Case putCaseProviderMapping(String Id, String Subject, String Origin){
        // Put = Insert + Update
        // Id varsa günceller yoksa yeni record oluşturur. 
        // Postman GoRest için Param, Body form-dataile veri gönderir. 
        // Postman Salesforce için Body Raw ile veri gönderir. POST -> Body -> Raw
        // Raw Json verileri içinde parametreden gelen veriler bulunmalıdır. 
        // Postman request contact-type, response contact-type ile aynı olmalıdır.   
        Case newCase = new Case();
        	newCase.Id = Id; 
            newCase.Subject = Subject; 
            newCase.Status = 'New'; 
            newCase.Priority = 'Low'; 
        	newCase.Origin = Origin; 
        	// Mapping için gelen değişken ile fieldname aynı olmalıdır. 
        	// Kasi durumda Container kullanılır. (CaseContainer)
        upsert NewCase;        
        /*
         {
			"Id": "5008d00000W3a5AAAR",
            "Subject": "New Case",
            "Origin": "Phone"        
        }
		*/
        return newCase; 
        // Case:{Subject=Yeni Case, Status=New, Priority=Low, Origin=Web}
    }
    
    
    
     //========================================================================
    
    
    
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