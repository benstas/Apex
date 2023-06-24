trigger AccountTriggerUndelete on Account (before insert, before update , before delete , after insert , after update, after delete, after undelete) {
	
    SWITCH on Trigger.operationType {
        
		WHEN AFTER_UNDELETE   { 
            /*
            for(Account newAcc : trigger.new) {
           		
                List<Contact> contactQuery = [SELECT Id, Name, Description FROM Contact WHERE AccountId = :newAcc.Id];
                              
                List<Contact> conList = new List<Contact>(); 
                
                for (Contact con : contactQuery) {
                    con.Description = 'Account restore edildi. ';
                    conList.add(con);
                }
                update conList;                 
            }  
            */
                    
            List<Contact> contactQuery = [SELECT Id, Name, Description FROM Contact WHERE AccountId = :trigger.newMap.keySet()];
            
            List<Contact> conList = new List<Contact>(); 
                
            String restoredOwner = System.UserInfo.getName(); 
            Date restoredDate = System.today();
        
            for (Contact con : contactQuery) {
                con.Description = 'Account newMap ile restore edildi. Restore eden kişi: ' + 
                    'restoredOwner ' + 'Restore zamanı: ' + restoredDate;
                conList.add(con);
            }
            update conList;  
        }
    }    
}