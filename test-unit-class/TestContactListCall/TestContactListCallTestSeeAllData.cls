@IsTest
public class TestContactListCallTestSeeAllData {
    
    
    @IsTest(SeeAllData=True) // DB bağlanabilir. 
    static void contactSayisiTest() {
        
        Account acc1 = [SELECT Id FROM Account WHERE Name = 'Wisequarter' LIMIT 1]; 
        
        Integer sonuc1 = TestContactListCall.contactSayisi(acc1.Id); 
        System.assertEquals(1, sonuc1); 
        
        //--------------------------------------------
        
        Account acc2 = [SELECT Id FROM Account WHERE Name = 'Burlington Textiles Corp of America ms ms ms' LIMIT 1]; 
        
        Integer sonuc2 = TestContactListCall.contactSayisi(acc2.Id); 
        System.assertEquals(0, sonuc2);  
    }
    
    
    //=========================================================
    
    
     @IsTest(SeeAllData=True) // DB bağlanabilir. 
    static void contactListesiTest() {
        
        Account acc = [SELECT Id FROM Account WHERE Name = 'Wisequarter' LIMIT 1]; 
        
        List<Contact> sonuc = TestContactListCall.contactListesi(acc.Id); 
        Integer conCount = sonuc.size(); 
        System.assertEquals(1, conCount); 
    }    
}