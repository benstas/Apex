public class MusteriCalloutClient {	
    // MusteriCalloutClient.getMusteriList();     
    
    //@future(callout=true) // Normal kod yazarken yazılmalı
    public static void getMusteriList() {
    // Http Class 
    // -> https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http.htm 
    // HttpRequest Class 
    // -> https://developer.salesforce.com/docs/atlas.en-us.244.0.apexref.meta/apexref/apex_classes_restful_http_httprequest.htm
       
        Http http = new Http(); 
        
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users');
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req);       
 	}
        // System.debug(res); // System.HttpResponse[Status=OK, StatusCode=200]
        //
        // System.debug( res.getHeaderKeys() );
        // (Transfer-Encoding, CF-RAY, Server, X-Ratelimit-Remaining, X-Content-Type-Options, Connection, Pragma, Date, Via, X-Ratelimit-Reset, ...)
        // System.debug( res.getHeader('Date') ); // Thu, 13 Jul 2023 07:48:46 GMT
        // System.debug( res.getHeader('Content-Type') ); // application/json; charset=utf-8
        // 
        // System.debug( res.getBody() ); // JSON -> [{},{},{}]        
        // 
        // System.debug( res.getStatus() ); // OK
        // System.debug( res.getStatusCode() ); // 200
        // 
        // @future(callout=true) kullanılırsa bunlar görülemez. 
        // biz dışarından veri aldığımız için public class olur.                 
    

    //====================================================
    
    // MusteriCalloutClient.getMusteriListAndSave(); 
    public static void getMusteriListAndSave() {
        
        Http http = new Http(); 
        
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users');
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); // JSON
        String customerJson = res.getBody(); 
        // Google -> Salesforce JSON Class
        // https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_System_Json.htm
        // 
        // List<Customer__c> customerObj = (List<Customer__c>) JSON.deserialize(customerJson, Customer__c.class);  
        // Fieldlar __c ile bittiği için eşleşme olmaz. 
        // Id uyuşmazlığı hem type hem de salsforce kendi verir
        // Çözüm -> Costomer__c - Container Class - JSON
        List<CustomerContainer> CustomerContainer = (List<CustomerContainer>) JSON.deserialize(customerJson, List<CustomerContainer>.class);
        
        List<Customer__c> cusList = new List<Customer__c>(); 
        
        for(CustomerContainer c : CustomerContainer) {
            
            Customer__c cus = new Customer__c(); 
            
            cus.Name = c.name; 
            cus.email__c = c.email; 
            cus.gender__c = c.gender; 
            cus.status__c = c.status; 
            
            cusList.add(cus); 
        }
        insert cusList; 
    }
	
    //=================================
    
    // MusteriCalloutClient.getMusteriSingleParamAndSave(); 
    public static void getMusteriSingleParamAndSave(String customerId) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users?id=3630528 
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users?id=' + customerId);
        	// Array döner
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); // JSON
        String customerJson = res.getBody(); 
        
        List<CustomerContainer> CustomerContainer = (List<CustomerContainer>) JSON.deserialize(customerJson, List<CustomerContainer>.class);
        
        List<Customer__c> cusList = new List<Customer__c>(); 
        
        for(CustomerContainer c : CustomerContainer) {
            
            Customer__c cus = new Customer__c(); 
            
            cus.Name = c.name; 
            cus.email__c = c.email; 
            cus.gender__c = c.gender; 
            cus.status__c = c.status; 
            
            cusList.add(cus); 
        }
        
        insert cusList; 
    }

	//=================================
	
    // MusteriCalloutClient.getMusteriFilterParamAndSave('Divjot','female'); 
    public static void getMusteriFilterParamAndSave(String customerName, String customerGender) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/?name=Divjot&gender=female
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users/?name=' + customerName + '&gender=' + customerGender);
        	// Array döner
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); // JSON
        String customerJson = res.getBody(); 
        
        List<CustomerContainer> CustomerContainer = (List<CustomerContainer>) JSON.deserialize(customerJson, List<CustomerContainer>.class);
        
        List<Customer__c> cusList = new List<Customer__c>(); 
        
        for(CustomerContainer c : CustomerContainer) {
            
            Customer__c cus = new Customer__c(); 
            
            cus.Name = c.name; 
            cus.email__c = c.email; 
            cus.gender__c = c.gender; 
            cus.status__c = c.status; 
            
            cusList.add(cus); 
        }
        
        insert cusList; 
    }

    //=================================
    	
    	// MusteriCalloutClient.getMusteriFilterBodyParamAndSave('Kalinda','female'); 
        public static void getMusteriFilterBodyParamAndSave(String customerName, String customerGender) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/?name=Divjot&gender=female
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users');
     		req.setMethod('GET');
            String UrlJson = '[{ "name": ' +' "'+ customerName + '" '+ ',"gender":' + ' "' + customerGender + '" ' + '}]';
        	req.setBody(UrlJson);
            
        HttpResponse res = http.send(req); // JSON
            System.debug(res);
     /*   String customerJson = res.getBody(); 
        
            
        List<CustomerContainer> CustomerContainer = (List<CustomerContainer>) JSON.deserialize(customerJson, List<CustomerContainer>.class);
        
        List<Customer__c> cusList = new List<Customer__c>(); 
        
        for(CustomerContainer c : CustomerContainer) {
            
            Customer__c cus = new Customer__c(); 
            
            cus.Name = c.name; 
            cus.email__c = c.email; 
            cus.gender__c = c.gender; 
            cus.status__c = c.status; 
            
            cusList.add(cus); 
        }
        
        insert cusList; 
            */
    }

}