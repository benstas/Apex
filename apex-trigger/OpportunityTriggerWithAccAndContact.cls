trigger OpportunityTriggerWithAccAndContact on Opportunity (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
 
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { }
        
        WHEN AFTER_UPDATE   { 
			/* 
Opp update edildiğinde bu oppların accountuna oppların Account fieldlarındaki Idleri bir sete depolayarak ulaşınız. 
Daha sonra bu accountların aktif olup olmadıklarını kontrol ediniz. 
Eğer aktiflerse bunların yeni bir Id setine depolayıp, bunların contactlarına bu Is seti ile ulaşınız. 
Ulaştığınız bu contactların descriptionlarını update ediniz. 

			*/
            Set<Id> oppIdSet = new Set<Id>(); 
            
            for(Opportunity newOpp : Trigger.new) {
                oppIdSet.add(newOpp.AccountId);   
            }
            
            List<Account> accList = [SELECT Id, Name FROM Account WHERE Id =: oppIdSet AND Active__c = 'Yes']; 
            // (Account:{Id=0018d00000g46AlAAI, Name=Deneme recap INSERTED})
           
            Set<Id> accIdSet = new Set<Id>();
            
            for(Account acc : accList) {
                
                accIdSet.add(acc.Id);
            }
            
            List<Contact> conList = [SELECT Id, Name FROM Contact WHERE AccountId =: accIdSet];
            
            List<Contact> conList2 = new  List<Contact>(); 
            
            for(Contact con : conList) {
                
                con.Description = 'update edildi..'; 
                
                conList2.add(con); 
            }
            update conList2; 
                
        }
        
        
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { } 
    }
}

