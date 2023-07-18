@RestResource(UrlMapping='/cases/*')
global class DeleteCaseProviderManager {

    // CaseProviderManager.deleteCaseProvider();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases/id
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
        
}

