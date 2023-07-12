@RestResource(UrlMapping='/opportunities') 
global class IntegrationOpportunityProvider {
	// https://mscom-6b-dev-ed.develop.my.salesforce.com/opportunities 
	// global
	
    @HttpGet
    global static List<Opportunity> getOppDatas() {
        
        List<Opportunity> oppList = [SELECT Id, Name, StageName FROM Opportunity]; 
        // İstenen fieldlar filtrenerek verilebilir. 
        return oppList; 
    }
    
    //-------------------------------------------------------------------------
    
    @HttpPost
    global static string getOppDatas(String name, String stage, Date closeDate) {
        
        Opportunity opp = new Opportunity(); 
        
        opp.Name = name; 
        opp.StageName = stage; 
        opp.CloseDate = closeDate; 
        
        insert opp; 
        
        return ''; 
    }	
}