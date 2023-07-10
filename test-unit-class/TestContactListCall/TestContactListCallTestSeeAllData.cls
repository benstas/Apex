@IsTest
public class TestContactListCallTestSeeAllData {
    
    @IsTest(SeeAllData=True) // DB bağlanabilir. 
    static void contactSayisiTest() {
        
        Account acc = [SELECT Id FROM Account WHERE Name = 'Wisequarter' LIMIT 1]; 
        
        Integer sonuc1 = TestContactListCall.contactSayisi(acc.Id); 
        // Id dinamik olmalıdır '0018d00000eb4f2AAA' şeklinde olamaz.
        // Deploy ederken sorun oluşturur.  
        System.assertEquals(1, sonuc1); 
    }
    
}