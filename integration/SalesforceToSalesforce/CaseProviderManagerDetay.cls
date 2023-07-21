@RestResource(UrlMapping='/case/*')
global class CaseProviderManagerDetay {
    
	
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/case/id
    
    // CaseProviderManagerDetay.getCaseProviderD(); 
    @HttpGet
    global static List<Case> getCaseProviderD() {
        
	 	RestRequest request = RestContext.request; 
        
        String gosterileceCase = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        // 5008d00000W3ZwNAAV
        string Filtre =  request.requestURI.substring(request.requestURI.IndexOf('?')+1);
        // /case/5008d00000W3ZwNAAV   
        
     	if ( gosterileceCase.length() == 18 ){
        	
            case singleCase = [SELECT Type, Status, Reason, Origin, Subject, Priority FROM case WHERE id =:gosterileceCase];
            
            List<Case> casesList = new List<Case>();
            
            	casesList.add(singleCase);
            
                return casesList; 
            
            
            } else if ( Filtre.contains('Origin') ||  Filtre.contains('Status')){
            /*
                String caseId = request.params.get('id');
                String caseStatus = request.params.get('Status');
                String caseType = request.params.get('Type');
                String casePriority = request.params.get('Priority');
                system.debug('caseId ' + caseId);
                system.debug('caseStatus ' + caseStatus);
                system.debug('caseType ' + caseType);
                system.debug('casePriority ' + casePriority);
            */
            // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/case?Origin=Web
            // postman de parametreye Origin girildiginde ( orijin dogru girilecek   yanlislar burada degerlendirlimedi.)
            
          	String caseOrigin = request.params.get('Origin');
                
         	List<case> caseList = [SELECT  Type, Status, Reason, Origin, Subject, Priority FROM case WHERE Origin=:caseOrigin];
            
           	return  caseList;
                
        } else {
                
               	List<case> caseList = [SELECT  Type, Status, Reason, Origin, Subject, Priority FROM case Limit 5];
                
                return caseList;
            }
                
    }
    
    
    global static List<Case> getCaseProvider(){
        
       	List<case> caseList = [SELECT Type, Status, Reason, Origin, Subject, Priority FROM case Limit 5]; 
       	// (Case:{Status=New, Origin=Phone, Subject=Deneme Case, Priority=Medium, Id=5008d00000W3Y3WAAV})
       	// JSON.serialize(o) işini Salesforce yapar. 
    	return caseList;     
       
    }   
    
    
    
    //=====================================
    
    // https://mscom-6b-dev-ed.develop.my.salesforce.com/services/apexrest/case
    
    // CaseProviderManagerDetay.doPost();
    @HttpPost
    global static List<Case> doPost() {
        
        RestRequest request = RestContext.request;
        
        String gelenBody = RestContext.request.requestBody.toString();
        // Body ile gelen JSON        
        system.debug('gelenBody' + gelenBody);
        
        integer kacDefa = gelenBody.countMatches('attributes');
        system.debug('attributes kacDefa geciyor   ' +  kacDefa);
		// attributes kelimesi kaç kere geçiyor  
		
        
        List<case> caseList =  new List<Case>();
        
        if (kacDefa == 1 ){
            
           Map<String, Object> myMap = (Map<String, Object>) JSON.deserializeUntyped(gelenBody);
            // Gelen JSON Map olur
           system.debug('myMap keyset ::: ' + myMap.keyset());
            
            Case newCase = new Case ();
                newCase.Subject  = (STRING)myMap.get('Subject');
                newCase.Status   = (STRING)myMap.get('Status');
                newCase.Reason   = (STRING)myMap.get('Reason');
                newCase.Origin   = (STRING)myMap.get('Origin');
                newCase.Priority = (STRING)myMap.get('Priority');
            insert newCase;
            
            caseList.add(newCase);
            
         } 
        else if (kacDefa > 1) {
                //  eger list olarak bir insert yapilacaksa asagodaki kod gecerli olur
             List<Object> responseList =   (List<Object>) JSON.deserializeUntyped(gelenBody);
                  
             For(Object obj : responseList  ) {
                 
                       Map<String,Object> myMap= (Map<String,Object>)obj;
                 
                        Case newCase = new Case ();
                            newCase.Subject  = (STRING)myMap.get('Subject');
                            newCase.Status   = (STRING)myMap.get('Status');
                            newCase.Reason   = (STRING)myMap.get('Reason');
                            newCase.Origin   = (STRING)myMap.get('Origin');
                            newCase.Priority = (STRING)myMap.get('Priority');
                       caseList.add(newCase);
                    }
            
           		Database.insert(caseList);
              }
       
        
      		return caseList;
      
    	}

}