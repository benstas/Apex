public class CaseClientCallout {
	
    
    
    // CaseClientCallout.getCaseList(); 
    public static void getCaseList() {
        
        Http http = new Http(); 
        
       	HttpRequest req = new HttpRequest();
        
        	req.setMethod('GET');
        	
        	// req.setEndpoint('callout:DeneNamed' + '/cases'); // api name // URL + TOKEN
        	//               https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest
       		req.setEndpoint('https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases');
        	req.setHeader('Authorization', 'Bearer !AQMAQL9SARTTm16zcffSixWVb3mcJNvePWV1b7Zu_BGYWB4up.2G4cFhZ6T8anRm8agtEmtWBgWaXCeaB94.gwuV44D_yvz8');
     		        	        
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
			request.setHeader('Authorization', 'Bearer !AQMAQL9SARTTm16zcffSixWVb3mcJNvePWV1b7Zu_BGYWB4up.2G4cFhZ6T8anRm8agtEmtWBgWaXCeaB94.gwuV44D_yvz8');
        	// Authorization sorun olursa 401 hatası alınır. 
       		request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        
            string body = '{"Subject":"YYYYCase from client", "Origin":"Phone"}';
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
    
    
    
    //===============================
   
    
    
    // CaseClientCallout.postCaseTrigger();  // 
    @future(Callout=true) // Trigger ile kullanılır
    public static void postCaseTrigger(String caseId){
        
        Http http=new Http();
        
        HttpRequest request= new HttpRequest();    
        	
            request.setMethod('POST');
        
            // request.setEndpoint('callout:SabahEkibiIleIletisim' + '/cases');        
        	request.setEndpoint('https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/cases');
			request.setHeader('Authorization', 'Bearer !AQMAQL9SARTTm16zcffSixWVb3mcJNvePWV1b7Zu_BGYWB4up.2G4cFhZ6T8anRm8agtEmtWBgWaXCeaB94.gwuV44D_yvz8');
        	// Authorization sorun olursa 401 hatası alınır. 
       		request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        	
        	Case caseObj = [SELECT Subject, Origin FROM Case WHERE Id =: caseId];  
        
        	CaseContainer cc = new CaseContainer();
        		cc.Subject = caseObj.Subject;
        		cc.Origin = caseObj.Origin;
                
            String body = JSON.serialize(cc); 
        
        	// System.debug(body);
        	// string body = '{"Subject":"ZZZZCase from client", "Origin":"Phone"}';
            request.setBody(body);
      
        HttpResponse  response= http.send(request);
        
         if(response.getStatusCode() ==  201 || response.getStatusCode() ==  200 ){
            
            system.debug('response  ' + response.getStatusCode());
         
        } else { 
            system.debug('Error :: ' + response.getStatusCode());
          } 
        
    }
}