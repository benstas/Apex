public class DeleteCustomerCalloutClient {
    
    public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    public static FINAL String TOKEN = 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d'; 
	
	// DeleteCustomerCalloutClient.deleteCustomerEndPoint('3688417');     
	public static void deleteCustomerEndPoint(String id) {
        
        Http http = new Http(); 
        
        HttpRequest request = new HttpRequest();
        	// https://gorest.co.in/public/v2/users/3689588
            request.setEndpoint(END_POINT + '/' + id); 
            request.setMethod('DELETE');
        	request.setHeader('Authorization', TOKEN);
       
        // İsteği gönder ve yanıtı al
        HttpResponse response = http.send(request); 
    
        // Yanıtı işle
        if (response.getStatusCode() == 204) { 
            System.debug('Deletion successful.');
        } else {
            System.debug('HTTP Error: ' + response.getStatusCode());
        }
       
    }

}