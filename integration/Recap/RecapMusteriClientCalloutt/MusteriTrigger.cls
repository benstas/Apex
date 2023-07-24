trigger MusteriTrigger on Musteri__c (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
	
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        
        WHEN AFTER_INSERT   { 
        	
            for(Musteri__c musteri : Trigger.new) {
                
                //RecapMusteriClientCalloutt.postMusteri(musteri.Name, musteri.Email__c, musteri.Status__c, musteri.Gender__c ); 
                RecapMusteriClientCalloutt.postMusteriBody(musteri.Id); 
            }
        }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}