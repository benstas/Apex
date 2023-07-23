@RestResource(urlMapping='/account/*')
global class AccountProviderRecapIntegration {
	// System.debug(System.Url.getSalesforceBaseUrl()); 
    // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest
    
    // System.debug(System.UserInfo.getSessionId().substring(15));
    // !ARkAQCdXI_rJ_O0_1cM29_PZMwiwnEeTPLtukRl3ifHzaFNAyuMDuoA3MioKg86JvCl5k2Anh4SEjEkTx7AKsR9m7_I42cBh
    
    // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest?name=Account4&rating=Hot
    @HttpPost
    global static List<Account> doPost() {
        
        RestRequest req = RestContext.request; 		
		// req.params.get() -> Parametre değerlerine ulaşılır. 
		// req.headers -> Header değerlerine ulaşılır.  
		// req.requestBody -> Body değerlerine ulaşılır.   
		// req.requestURI -> Endpoint değerlerine ulaşılır.    
		
        // / şeklinde parametreden bilgi alma
		req.requestURI.substring(req.requestURI.lastIndexOf('/')+1); 	
        
        // ? şeklinde filtreli parametreden bilgi alma
        String name = req.params.get('name'); 
        String rating = req.params.get('rating'); 
        
         // body ile bilgi alma
        String requestBody = ' {"name":"account3", "rating","Hot"} '; 
        Map<String, Object> gelenJson = (Map<String, Object>) JSON.deserializeUntyped(requestBody);         
        String ratingg = (String) gelenJson.get('rating'); 
        
        Map<String, Object> params = (Map<String, Object>) jSON.deserializeUntyped(req.requestBody.toString()); 
        
        
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5]; 
        return accList; 
    }
}








