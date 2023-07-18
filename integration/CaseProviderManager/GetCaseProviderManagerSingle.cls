@RestResource(UrlMapping='/cases/*')
global class GetCaseProviderManagerSingle {

    // CaseProviderManager.getCaseProviderSingle();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases/id
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
}
