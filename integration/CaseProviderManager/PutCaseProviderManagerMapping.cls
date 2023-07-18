@RestResource(UrlMapping='/cases/*')
global class PutCaseProviderManagerMapping {

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
}


