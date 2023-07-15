public class GetCustomerCalloutClientBestPractice {
    
    // End point değişkene aktarılması best practice
    public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    // @future(callout=true) // Normal kod yazarken yazılmalı    
    
    // GetCustomerCalloutClientBestPractice.getCustomerList();     
    public static void getCustomerList() {   
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint(END_POINT);
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req);    
        
        // Status code ile işlem best practice
        if(res.getStatusCode() == 200){
            System.debug( res.getBody() ); 
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
         
 	}       
        

    //====================================================
    
    
    // GetCustomerCalloutClientBestPractice.getCustomerListAndSave(); 
    public static void getCustomerListAndSave() {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint('https://gorest.co.in/public/v2/users');
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); 
     
        // Status code ile işlem best practice
        if(res.getStatusCode() == 200){
            
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
            
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
       
    }
	
    
    //=================================
    
    
    // GetCustomerCalloutClientBestPractice.getCustomerParamIdAndSave('3681837'); 
    public static void getCustomerParamIdAndSave(String customerId) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users?id=3681837
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint(END_POINT + '?id=' + customerId);
        	// Array döner
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); 
        
        // Status code ile işlem best practice
        // Aynı zamanda object değil list geldiğnden list dolu mu boş mu kontrol edilmeli 
        if(res.getStatusCode() == 200 ){
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
            
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
      
    }

    
	//=================================
	
    
    // GetCustomerCalloutClientBestPractice.getCustomerParamFilterAndSave('Divjot','female'); 
    public static void getCustomerParamFilterAndSave(String customerName, String customerGender) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/?name=Divjot&gender=female
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint(END_POINT + '/?name=' + customerName + '&gender=' + customerGender);
        	// Array döner
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); // JSON
        
        // Status code ile işlem best practice
        if(res.getStatusCode() == 200){
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
            
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
        
        
    }

    
    //=================================
    	
    
    // GetCustomerCalloutClientBestPractice.getCustomerEndPointIdAndSave('3681836'); 
    public static void getCustomerEndPointIdAndSave(String id) {
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/3681836
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint(END_POINT + '/' + id);
        	// Single record
     		req.setMethod('GET');
        
        HttpResponse res = http.send(req); 
      
        // Status code ile işlem best practice
        if(res.getStatusCode() == 200){
            
            String customerJson = res.getBody(); 
        
            CustomerContainer c = (CustomerContainer) JSON.deserialize(customerJson, CustomerContainer.class);
            
            Customer__c cus = new Customer__c(); 
                
                cus.Name = c.name; 
                cus.email__c = c.email; 
                cus.gender__c = c.gender; 
                cus.status__c = c.status; 
            
            insert cus; 
            
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
  		
    }
}