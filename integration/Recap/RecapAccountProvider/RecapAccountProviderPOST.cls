@RestResource(UrlMapping='/accountpost/*')
global class RecapAccountProviderPOST {
	
    // https://wise-3a-dev-ed.develop.my.salesforce.com/services/apexrest/accountpost?name123=mmmmm&rating123=Warm
    global static Account postAccountFiltre() {
        
        RestRequest req = RestContext.request;
		
        List<Account> accList = new List<Account>(); 
        
        Account acc = new Account();
        	acc.Name= req.params.get('name123');
			acc.Rating= req.params.get('rating123');
        
        insert acc;
        
        return acc; 
    }
}