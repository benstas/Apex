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
        System.assertEquals(1, sonuc); 
        
        //------------------------------------------
        
        Account acc2 = new Account(); 
        acc2.Name = 'Elma'; 
        insert acc2; 
        
        Integer sonuc2 = TestContactListCall.contactSayisi(acc2.Id); 
        System.assertEquals(0, sonuc2);     
        
    }
    
    //================================================
    
    static void contactListesiTest() {
        
        Account acc = new Account(); 
        acc.Name = 'Armut'; 
        insert acc; 
        
        Contact con1 = new Contact(); 
        con1.Lastname = 'Test'; 
        con1.AccountId = acc.Id; 
        insert con1; 
        
        Contact con2 = new Contact(); 
        con2.Lastname = 'Deneme'; 
        con2.AccountId = acc.Id; 
        insert con2; 
        
        List<Contact> sonuc = TestContactListCall.contactListesi(acc.Id); 
        Integer conCount = sonuc.size(); 
        System.assertEquals(2, conCount); 
    }
}