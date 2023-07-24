public class RecapMusteriClientCalloutt {
	
    // Param ile Post
    // Body ile Single Post
    // Body ile Multiple Post
    
    // RecapMusteriClientCalloutt.postMusteri('Murat2','mrt2@example.com','active','male'); 
    @future(callout=true)
    public static void postMusteri(String name, String email, String status, String gender) {
        
        Http http = new Http(); 
        
        HttpRequest request = new HttpRequest();        
        	request.setMethod('POST'); 
        	request.setEndpoint('https://gorest.co.in/public/v2/users?name=' + name + '&email=' + email + '&status=' + status + '&gender=' + gender);
        	request.setHeader('Authorization', 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d');
        	request.setHeader('Content-Type', 'application/json;charset=UTF-8');
                
        
        HttpResponse response = http.send(request);
        	System.debug(response.getStatus());
        	System.debug(response.getStatusCode());
        	System.debug(response.getBody());
        
    }
	
    
    //=======================================================
    
    
    // RecapMusteriClientCalloutt.postMusteriBody('a028d00000CYEBGAA5'); 
    @future(callout=true)
    public static void postMusteriBody(String musteriId) {
        
        Http http = new Http(); 
        
        HttpRequest request = new HttpRequest();        
        	request.setMethod('POST'); 
        	request.setEndpoint('https://gorest.co.in/public/v2/users');
        	request.setHeader('Authorization', 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d');
        	request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        	
        	// SF Object -> Container -> JSON Object
        	Musteri__c mst = [SELECT Id, Name, Email__c, Gender__c, Status__c FROM Musteri__c WHERE Id =: musteriId];         
        	// Musteri__c:{Id=a028d00000CYEBGAA5, Name=Mateus, Email__c=mateus@example.com, Gender__c=male, Status__c=active}
        	
        		MusteriContainer cnt = new MusteriContainer();
        
                cnt.name = mst.name;
                cnt.email = mst.email__c;
                cnt.status = mst.status__c;
                cnt.gender = mst.gender__c;
            
            String body= JSON.serialize(cnt);
            request.setBody(body);   
         
        
        HttpResponse response = http.send(request);
        	System.debug(response.getStatus());
        	System.debug(response.getStatusCode());
        	System.debug(response.getBody());
      
    }
    
    
    //=======================================================
    
    
    // RecapMusteriClientCalloutt.postMusteriBody('a028d00000CYEBGAA5'); 
    //@future(callout=true)
    public static void postMusteriBodyList(List<Id> insertId) {
        
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();        
            req.setMethod('POST');
            req.setEndpoint('https://gorest.co.in/public/v2/users/');
            req.setHeader('Authorization', 'Bearer f0fb965a5ff6a9cd6663a1f3b4c8663f18396ea25183a582afc08524704e838d');
        	
        	List<Musteri__c> mstList = [SELECT Id, Name, Email__c, Gender__c, Status__c FROM Musteri__c WHERE ID=:insertId];
        
        	List<MusteriContainer> newList = new List<MusteriContainer>();
        	
        	for(Musteri__c mst: mstList){
                
                MusteriContainer cnt = new MusteriContainer();
                
                cnt.name= mst.name;
                cnt.email=mst.email__c;
                cnt.status=mst.status__c;
                cnt.gender=mst.gender__c;
                 
                newList.add(cnt);    
          	}
        	
        	String jsonSyntax= JSON.serialize(newList);
        	req.setBody(jsonSyntax);
        
        
        HttpResponse resp = Http.send(req);
        
            if(resp.getStatusCode()==201){
                
                system.debug(resp.getBody());
            }else{
                
                system.debug(resp.getStatusCode()+ '  error' );
            }
    }
}