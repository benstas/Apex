@RestResource(UrlMapping='/cases/*')
global class GetCaseProviderManager {

    /*
	Setup -> Company Settings -> My Domain -> Current My Domain URL 
	System.debug(System.Url.getSalesforceBaseUrl());
	https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases

	Authorization 
	System.debug(System.UserInfo.getSessionId().substring(15));
	Bearer Toeken
	!AQMAQBtxcsV8CG2xjtOpAMMxQo6DCxWAJzcoyOMrMCN64Xb4VCpG3MrGmrd1Xlzfsnm65.zxWd2bR374JpbKclMKp9wskbXM
	*/
    
    // CaseProviderManager.getCaseProvider();
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases
    @HttpGet
    global static List<Case> getCaseProvider(){
        
       	List<case> caseList = [SELECT Type, Status, Reason, Origin, Subject, Priority FROM case Limit 5]; 
       	// (Case:{Status=New, Origin=Phone, Subject=Deneme Case, Priority=Medium, Id=5008d00000W3Y3WAAV})
       	// JSON.serialize(o) işini Salesforce yapar. 
    	return caseList;        
    }       
}