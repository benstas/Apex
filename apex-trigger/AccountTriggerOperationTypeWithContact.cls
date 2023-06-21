trigger AccountTriggerOperationTypeWithContact on Account (before insert, before update, before delete, 
														  after insert, after update, after delete, after undelete) 
{
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
        /* 	If an account is created 
       		No matter what The rating of account should be ‘Hot’
           	and BillingState should be ‘ARKANSAS’
		*/
                
            for(Account sepet: Trigger.new){
            sepet.rating= 'Hot';
            sepet.BillingState = 'ARKANSAS';                           
            }
        }
        
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        
        WHEN AFTER_INSERT   { 
       	/*  
     	If an account is created  ( account name is  xxxx)
     	Create a contact related to newly created account
      	Contact name can be ‘ Contact of  xxxx 
		*/
            List<Contact> newConList = new List<Contact>(); 
        
            for(Account acc : Trigger.new) {        
                
                Contact newCon = new Contact();
                
                newCon.LastName = 'Contact of ' + acc.name;      
                newCon.accountId = acc.Id; 
                
                newConList.add(newCon);             
            }
        
        	insert newConList; // Bulkify 
            // before insert ile de çalışır ama related sağlanamaz. 
        }
        
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
    }
}

/*
Account acc = new Account(); 
acc.name = 'AAA Deneme'; 
acc.Rating = 'Warm';

insert acc; 
*/