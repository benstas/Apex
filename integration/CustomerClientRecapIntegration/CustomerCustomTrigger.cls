trigger CustomerCustomTrigger on Customer__c (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
   
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { 
            
        	for(Customer__c newCus : Trigger.old) { 
                
				CustomerClientRecapIntegration.deleteCustomerDelProvider(newCus.Go_Rest_Id__c);
            }
        }
        
        WHEN AFTER_INSERT   { 
            
        	for(Customer__c newCus : Trigger.new) { 
                
         		PostCustomerCalloutClient.postCustomerBody(newCus.Name, newCus.email__c, newCus.gender__c, newCus.status__c);

            }
            
            
        }
        
        WHEN AFTER_UPDATE   { 
            /*
            for(Customer__c newCus : Trigger.new) {
                Customer__c oldCus = Trigger.oldMap.get(newCus.Id); 
                
                if(newCus.GoReste_Gonder__c != oldCus.GoReste_Gonder__c && newCus.GoReste_Gonder__c) {
                    PostCustomerCalloutClient.postCustomerBody(newCus.Name, newCus.email__c, newCus.gender__c, newCus.status__c);
                }
            }
        	*/
            for(Customer__c newCus : Trigger.new) {
                CustomerClientRecapIntegration.updateCustomerPatchProvider(newCus.Go_Rest_Id__c);
            }
        }
        
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}