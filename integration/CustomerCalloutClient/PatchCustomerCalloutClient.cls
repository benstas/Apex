public class PatchCustomerCalloutClient {
	
    public static FINAL String TOKEN = 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d'; 
    public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    
    public static String name = 'Ahmet'; 
    public static String email = 'ahmet@example.com'; 
    public static String gender = 'male'; 
    public static String status = 'active'; 
    
    // @future(callout=true) // Normal kod yazarken yazılmalı        
    // PatchCustomerCalloutClient.patchCustomerList('3723977');     
    public static void patchCustomerList(String id) {   
        
        Http http = new Http(); 
        // https://gorest.co.in/public/v2/users/3723977
       	HttpRequest req = new HttpRequest();
       		req.setEndpoint(END_POINT + '/' + id);
     		req.setMethod('PATCH');
        	req.setHeader('Content-Type', 'application/json; charset=utf-8');
            req.setHeader('Authorization', TOKEN);
        	string jsonBody = '{"name": "' + name + '",  "email": "' + email + '", "gender": "' + gender + '", "status": "' + Status + '" }';
        	req.setBody(jsonBody);
        
        HttpResponse res = http.send(req); 
        
         if (res.getStatusCode() == 200) {
            String responseBody = res.getBody();
            System.debug('Response => ' + responseBody);
        } else {
            System.debug('HTTP Error: ' + res.getStatusCode());
        }
	}
    
}