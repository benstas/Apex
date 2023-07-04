trigger HastaTrigger on Hasta__c (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
   
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        
        WHEN AFTER_INSERT   {    
            HastaTriggerHandler.hastaPaylas(Trigger.new);                         
        }
        
        WHEN AFTER_UPDATE   { 
            
        	// update edildiginde yeni kisinin gormesi lazim
          	List<Id> hastaIdleri = new List<Id>();
          	List<Id> doktorIdleri = new List<Id>();
          	List<Id> hemsireIdleri = new List<Id>();
            
            for( Hasta__c hst : trigger.new    ){
                
                Hasta__c eskiHal = trigger.oldMap.get(hst.id);
                
                hastaIdleri.add(eskiHal.id);
                doktorIdleri.add(eskiHal.Doctor_Name__c);
                hemsireIdleri.add(eskiHal.Nurse_Name__c);
            }
            
           	List< Hasta__Share> silinecekRecordlar = [ SELECT id FROM Hasta__Share WHERE ParentId IN:  hastaIdleri
                                                       AND   (UserOrGroupId IN: doktorIdleri OR UserOrGroupId IN:hemsireIdleri )     ];
            delete silinecekRecordlar;
            
             HastaTriggerHandler.hastaPaylas(Trigger.new);  
        }
        
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}