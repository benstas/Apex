public class CaseClientCallout {
	
    
    
    // CaseClientCallout.getCaseList(); 
    public static void getCaseList() {
        
        Http http = new Http(); 
        
       	HttpRequest req = new HttpRequest();
        
        	req.setMethod('GET');
        	
        	req.setEndpoint('callout:DeneNamed' + '/cases'); // api name // URL + TOKEN
        	//               https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest
       		//req.setEndpoint('https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases');
        	//req.setHeader('Authorization', 'Bearer !AQMAQNAQYbr2BjGuttU0cH2FGiAOSUSWZDIlg5W2DAUrJBEjT89.w42905ug9vx5XTaC0lNWkRQAq3b0fhyfmA9nSByjobas');
     		        	        
        HttpResponse res = http.send(req); // Header / Body
        System.debug(res.getStatusCode());
        String responseJson = res.getBody();         
        /*
		[{"attributes":{"type":"Case","url":"/services/data/v58.0/sobjects/Case/5008d00000W3a5AAAR"},
		"Status":"New",
		"Origin":"Phone",
		"Subject":"Put Case",
		"Priority":"Low",
		"Id":"5008d00000W3a5AAAR"}, ..]
		*/
        
        // CaseContainer ile Json.deserialize(jsonString, System.apexType) kullanılabilir.  
        // Map ile Json.deserializeUntyped(jsonString) kullanılabilir. Yada çift for loop kullanılabilir.  
        
        if (res.getStatusCode() == 200 ){
            // JSON (res.getBody()) -> Objects -> Map (Container) -> Case
            List<object> gelenListe =  (List<object>) JSON.deserializeUntyped(responseJson);
            
            List<Case> insertEdilecekRecordlar = new List<case>(); 
            
            for( object obj : gelenListe ){
               
                  Map<string,Object> tekRecord=   (Map<string,Object>)obj ; 
                   
                   case yeniCaserecordu = new Case ();
                   
                   yeniCaserecordu.Subject = (string)tekRecord.get('Subject');
                   yeniCaserecordu.Origin = 'Email' ;
                   yeniCaserecordu.Reason =  (string)tekRecord.get('Reason');
                   yeniCaserecordu.Priority =  (string)tekRecord.get('Priority');
                   yeniCaserecordu.Status =  (string)tekRecord.get('Status');
                 
                  insertEdilecekRecordlar.add(yeniCaserecordu);
               }
            
            database.insert(insertEdilecekRecordlar);  
            
            /*     
            List<CaseContainer> accFromJson =  (List<CaseContainer>)JSON.deserialize(responseJson, List<CaseContainer>.class);     
            
                list<Case> caseList = new list<Case>();
                
                 For( CaseContainer mst:  accFromJson  ){

                     Case sonCase = new Case();

                     sonCase.Subject = mst.Subject;
                     sonCase.Priority= mst.Priority;
                     sonCase.Origin= mst.Origin;
                     sonCase.Status = mst.Status;

                   musteriListesi.add(sonCase);
               
                 }
          		insert caseList;
             */  
            
        } else {
           
           system.debug('ERROR -> ' + res.getStatusCode());
       }
     
    }

    
    
    //===============================
   
    
    
    // CaseClientCallout.postCase(); 
    // @future(Callout=true)
    public static void postCase(){
        
        Http http=new Http();
        
        HttpRequest request= new HttpRequest();     
        
            request.setMethod('POST');
        
            // request.setEndpoint('callout:SabahEkibiIleIletisim' + '/cases');        
        	request.setEndpoint('https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases');
        	request.setHeader('Authorization', 'Bearer !AQMAQN1EhfjD8YJcBc8eF5ViMtQXBmNicXjM5qRbSG_PbrZtWmLHzWZFVicNShEdjt0mYUROgjL8IzdZWwL2gOxnBMQcejYP');
     		//
       		request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        
            string body = '{"Subject":"XXXXcase from client", "Origin":"Web"}';
            request.setBody(body);
       
        HttpResponse  response= http.send(request);
        // system.debug(' response status code ' + response.getStatusCode());
       	
         if(response.getStatusCode() ==  201 || response.getStatusCode() ==  200 ){
            
            system.debug('response  ' + response.getBody());
         
        } else if (response.getStatusCode() == 302){
            
            request.setEndpoint(response.getHeader('Location'));
            HttpResponse newresponse = new Http().send(request);
            
        } else{ 
            system.debug('Error :: ' + response.getStatusCode());
        } 
    }
    
    
}