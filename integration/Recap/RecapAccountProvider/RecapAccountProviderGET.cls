@RestResource(UrlMapping='/accountget/*')
global class RecapAccountProviderGET {
	
    // System.debug(System.Url.getSalesforceBaseUrl()); 
    // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget
    // 
    // System.debug(System.UserInfo.getSessionId().substring(15));
    // !ARkAQOJjRB3DWEUq40Lbtf_rYLZGWWJYvtcBrB9v.HeBiaWDgbVO81BvqHUJoBbQVw7Zry7doDVdJzGR4L5XSfy2CWEmmDK4
   
    
    // RecapAccountProvider.getAccountList(); 
    @HttpGET
    global static List<Account> getAccountList(){
        
        // RestRequest req = RestContext.request;      
        // req.params.get() -> Parametre değerlerine ulaşılır. 
        // req.headers -> Header değerlerine ulaşılır.  
        // req.requestBody -> Body değerlerine ulaşılır.   
        // req.requestURI -> Endpoint değerlerine ulaşılır.  
        // RestResponse res = RestContext.response;  
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget/252525
        // req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);   
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget?name=Account4&rating=Hot
        // String name = req.params.get('name'); 
        // String rating = req.params.get('rating'); 
        // String ratingg = (String) gelenJson.get('rating'); 
        
        // body ile bilgi alma
        // String requestBody = ' {"name":"account3", "rating","Hot"} '; 
        // Map<String, Object> gelenJson = (Map<String, Object>) JSON.deserializeUntyped(requestBody);         
        // Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestBody.toString());  
        
        
        //-------------------------------------------------------------------------------		        		
        
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget
        /*
        List<Account> accList = [SELECT Id, Name FROM Account LIMIT 5];
        return accList;
        */
        
        
        //-------------------------------------------------------------------------------
        
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget/Warm
   		/*
        RestRequest req = RestContext.request;
        
        String param = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        List<Account> accList = [SELECT ID, NAME, Rating FROM ACCOUNT WHERE Rating =:param];
        
        return accList;     
        */
        
        
        //-------------------------------------------------------------------------------
        
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget?rating=Hot
        /*
        RestRequest req = RestContext.request;
        
        String filtre = req.params.get('rating');
        
        List<Account> accList = [SELECT ID, NAME, Rating FROM ACCOUNT WHERE Rating =:filtre];
        
        return accList;  
        */
        
        
        //-------------------------------------------------------------------------------
        
        
        // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountget
        /*	{
    			"Rating": "Hot"
			} */
       
        RestRequest req = RestContext.request;
        
        Map<String, Object> myMap =(Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
        // {Rating=Hot}
        String ratingParam = (String)myMap.get('Rating');
        
        List<Account> accList = [SELECT ID, NAME, Rating FROM ACCOUNT WHERE Rating =:ratingParam];
        
        return accList;  
    	
    	
        //-------------------------------------------------------------------------------
        
        
        /*
		RestRequest req = RestContext.request;
		
        String filtre= req.params.get('name');
        Account acc = [select id , name , rating from account where name=:filtre];
        
      	Container cnt = new Container();
        cnt.name= acc.name;
        cnt.status= acc.Rating;
        
        
   
        String jsonBody = JSON.serialize(cnt);
       	return jsonBody;
		*/
        
    }
	
}