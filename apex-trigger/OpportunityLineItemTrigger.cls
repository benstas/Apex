trigger OpportunityLineItemTrigger on OpportunityLineItem (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  {
            
          for(OpportunityLineItem oppLineItem : Trigger.new) {
                
                Opportunity opp = [SELECT Id, Name, Discount__c FROM Opportunity WHERE Id = : oppLineItem.OpportunityId]; 
                // Opportunity:{Id=0068d00000FGj0kAAD, Name=Deneme Opp 1}
                Product2 prd = [SELECT Id, Name FROM Product2 WHERE Id = : oppLineItem.Product2Id]; 
                // Product2:{Id=01t8d000006LBceAAG, Name=SLA: Silver}
                
                if(opp.Discount__c != null) {
                    
                    oppLineItem.Discount = opp.Discount__c;
               
                }
            }
        }
        
        WHEN BEFORE_UPDATE {
            
            for(OpportunityLineItem oppLineItem : Trigger.new) {
                
                Opportunity opp = [SELECT Id, Name, Discount__c FROM Opportunity WHERE Id = : oppLineItem.OpportunityId]; 
                // Opportunity:{Id=0068d00000FGj0kAAD, Name=Deneme Opp 1}
                Product2 prd = [SELECT Id, Name FROM Product2 WHERE Id = : oppLineItem.Product2Id]; 
                // Product2:{Id=01t8d000006LBceAAG, Name=SLA: Silver}
                
                if(opp.Discount__c != null) {
                    
                    oppLineItem.Discount = opp.Discount__c;
               
                }
            }
        }
            
  
	}
}