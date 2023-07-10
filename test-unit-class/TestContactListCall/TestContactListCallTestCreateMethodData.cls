@IsTest
public class TestContactListCallTestCreateMethodData {

    @IsTest // DB bağlanamaz. 
    static void contactSayisiTest() {
        
        Account acc = new Account(); 
        acc.Name = 'Armut'; 
        insert acc; 
        
        Contact con = new Contact(); 
        con.Lastname = 'Test'; 
        con.AccountId = acc.Id; 
        insert con; 
        
        Integer sonuc = TestContactListCall.contactSayisi(acc.Id); 
        // Id dinamik olmalıdır '0018d00000eb4f2AAA' şeklinde olamaz.
        // Deploy ederken sorun oluşturur.  
        System.assertEquals(1, sonuc); 
    }
}