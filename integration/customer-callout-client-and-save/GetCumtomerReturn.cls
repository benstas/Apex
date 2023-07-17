public class GetCumtomerReturn {
    
     public static FINAL String END_POINT = 'https://gorest.co.in/public/v2/users'; 
    
    // GetCumtomerReturn.getCustomerEndPoint('3723979'); 
    public static void getCustomerEndPoint(String id) {
        
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
       		// {"id":3723979,"name":"Dhanpati Mukhopadhyay","email":"dhanpati_mukhopadhyay@marks.test","gender":"male","status":"inactive"}
            System.debug(customerJson);
            // return customerJson; 
            // ERROR -> Missing return statement required return type: String 
        } else {
            System.debug('GET Method Error is ' + res.getStatusCode());
        }
  		
    }

}