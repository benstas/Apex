@RestResource(UrlMapping='/accountpatch/*')
global class RecapAccountProviderPATCH {
	
    // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountpatch?Id=20
    global static Account patchAccountFiltre() {
        
        RestRequest req = RestContext.request;
		
        String filtre = req.params.get('Id');
        
        Account acc = [select id, name , rating from account where id=:filtre];
		        
        Map<String, Object> myMap = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
        acc.Name = (String)myMap.get('name');
        acc.Rating = (String)myMap.get('rating');
        
        update acc;
        
        return acc; 
    }

    
    
    //===========================================
    
    
    
    global static Account patchAccountParamBody() {
        
        RestRequest req = RestContext.request;
		
        String filtre= req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        Account acc = [select id , name , rating from account where id=:filtre];
        
        Map<String, Object> myMap = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());        
            acc.name= (String)myMap.get('name');
            acc.Rating=(String)myMap.get('rating');
        update acc;
        
        return acc;
    }
	
    
    
    //===========================================
    
    
    
    global static Account patchAccountParamVariable() {
        
        RestRequest req = RestContext.request;
		
        String param = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        Account acc = [select id , name , rating from account where id=:param];
        
        acc.Name = req.params.get('name');
        acc.Rating = req.params.get('rating');
        	
        update acc; 
        
        return acc;
    }

    
}