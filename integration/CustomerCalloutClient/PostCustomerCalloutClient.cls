public class PostCustomerCalloutClient {
	
    public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    public static FINAL String TOKEN = 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d'; 
    
    
    // PostCustomerCalloutClient.postCustomerParam('Pınar','pinar@example.com','female','active'); 
    @future(callout=true) 
    public static void postCustomerParam(String name, String email, String gender, String Status) {
        
        Http http = new Http(); 
        
      	HttpRequest req = new HttpRequest();
            // https://gorest.co.in/public/v2/users?name=Murat&email=murat@example.com&gender=male&status=active
            req.setEndpoint(END_POINT + '?name=' + name + '&email=' + email + '&gender=' + gender + '&status=' + Status);
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('Authorization', TOKEN);
        
        HttpResponse res = http.send(req); 
        
        if (res.getStatusCode() == 201) {
            String responseBody = res.getBody();
            System.debug('Response: ' + responseBody);
        } else {
            System.debug('HTTP Error: ' + res.getStatusCode());
        }
    }

    
    //============================================
    
    
    // PostCustomerCalloutClient.postCustomerBody('Zehra','zehra@example.com','female','active');
    @future(callout=true) 
    public static void postCustomerBody(String name, String email, String gender, String Status) {
        
        Http http = new Http(); 
        
      	HttpRequest req = new HttpRequest();
            req.setEndpoint(END_POINT);
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('Authorization', TOKEN);
        	// Post işleminde Id verilmez. 
            string jsonBody = '{"name": "' + name + '",  "email": "' + email + '", "gender": "' + gender + '", "status": "' + Status + '" }';
        	req.setBody(jsonBody);
        
        HttpResponse res = http.send(req); 
        
        if (res.getStatusCode() == 201) {
            String responseBody = res.getBody();
            System.debug('Response: ' + responseBody);
        } else {
            System.debug('HTTP Error: ' + res.getStatusCode());
        }
    }

}