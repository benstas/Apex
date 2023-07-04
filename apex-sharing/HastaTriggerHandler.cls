public class HastaTriggerHandler {
	
    public static void hastaPaylas(List<Hasta__c> paylasilacakhastaListesi) {
        /*
        List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
            
            for(Hasta__c hst : paylasilacakhastaListesi) {
                
                Hasta__Share paylasilacakRecord = new Hasta__Share(); 
                
                // 4 Adet Field
                paylasilacakRecord.ParentId = hst.Id; 
                paylasilacakRecord.UserOrGroupId = hst.Doctor_Name__c; 
                paylasilacakRecord.AccessLevel = 'edit'; 
                paylasilacakRecord.RowCause = 'Manual'; 
                
                eklenecekRecordlar.add(paylasilacakRecord); 
            }
            
            for(Hasta__c hst : paylasilacakhastaListesi) {
                
                Hasta__Share paylasilacakRecord = new Hasta__Share(); 
                
                // 4 Adet Field
                paylasilacakRecord.ParentId = hst.Id; 
                paylasilacakRecord.UserOrGroupId = hst.Nurse_Name__c; 
                paylasilacakRecord.AccessLevel = 'edit'; 
                paylasilacakRecord.RowCause = 'Manual'; 
                
                eklenecekRecordlar.add(paylasilacakRecord); 
            }
                              
            insert eklenecekRecordlar; 
        */
        
        //--------------------------------------------------
        
        List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
        
        for(Hasta__c hst : paylasilacakhastaListesi) {
            
            Hasta__Share hemsirePaylasilacakRecord = hastaPaylas(hst.Id, hst.Nurse_Name__c); 
            eklenecekRecordlar.add(hemsirePaylasilacakRecord);
            
            Hasta__Share doctorPaylasilacakRecord = hastaPaylas(hst.Id, hst.Doctor_Name__c); 
            eklenecekRecordlar.add(doctorPaylasilacakRecord);
        }
        
        insert eklenecekRecordlar; 
    }
    
    //--------------------------------------------------
    
    public static Hasta__Share hastaPaylas(Id hastaId, Id paylas) {
        
         Hasta__Share paylasilacakRecord = new Hasta__Share(); 
                
         // 4 Adet Field
         paylasilacakRecord.ParentId = hastaId; 
         paylasilacakRecord.UserOrGroupId = paylas; 
         paylasilacakRecord.AccessLevel = 'edit'; 
         paylasilacakRecord.RowCause = 'Manual'; 
        
        return paylasilacakRecord; 
    }
    
}