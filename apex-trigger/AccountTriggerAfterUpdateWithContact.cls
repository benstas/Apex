trigger AccountTriggerAfterUpdateWithContact on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
   
    SWITCH on Trigger.operationType {        

        WHEN AFTER_UPDATE   { 
        	
            List<Contact> conList = new List<Contact>() ;
            
            for(Account newAcc : Trigger.new){
                Account oldAcc = Trigger.oldMap.get(newAcc.Id); 
                
                if(newAcc.Contacts__c != oldAcc.Contacts__c) {
                    
                    Contact con = new Contact();
                    con.AccountId = newAcc.Id;
                    con.FirstName = 'Hasan';
                    con.LastName = 'Deneme'; 
                    
                    conList.add(con); 
                }
            }
            insert conlist; 
            // Update -> After Update
            // Delete -> After Delete
            // Undelete -> After Undelete
        } 
    }
}