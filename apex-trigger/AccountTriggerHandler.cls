public class AccountTriggerHandler {
	
    // public static boolean flag = true; 
    public static Integer intFlag = 0;
    
    public static void recurtionExample(List<Account> accs) {        
            
            if(intFlag < 5) {
            	intFlag = intFlag + 1;  
                
                List<Account> accList = new List<Account>(); 
                
                for(Account acc : accs) {      
                    
                    Account newAcc = new Account();
                    // New olmazsa kendi olarak görür (read-only)
                    newAcc.Name = 'FirstName=’AAA new Account Created ' + intFlag;
                    accList.add(newAcc); 
                    
                    //intFlag = intFlag + 1; 
                }
                
                Database.insert(accList); 
                /*
                ERROR: Recursion (kısır döngü)
                AccountTriggerRecursion: execution of AfterInsert caused by: 
                System.DmlException: Insert failed.
				*/                
         	}
    }
}