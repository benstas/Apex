@isTest
public class TestContactListCallTestDataFactory {
	
    @isTest
    static Void contactSayisiTest(){
        // Acc
        Account acc = DataFactory.createAccount();
        /*  Account acc = new Account();
            acc.Name = 'Test';
            acc.BillingCountry ='Turkiye';
            acc.Phone ='123456789';
		*/        
        acc.Phone='8987633';
        acc.Fax = 'agdjsgds';
        insert acc;
        
        // Acc2
        Account acc2 = DataFactory.createAccount();
        acc2.Phone='8987633';
        insert acc2;
        
        //----------------------------
        
        contact cnt = DataFactory.createContact();        
        cnt.AccountId= acc.id;
        insert cnt;
        
        contact cnt2 = DataFactory.createContact();        
        cnt2.AccountId= acc.id;
        insert cnt2;
        
        //----------------------------
        
        Integer sonuc =   TestContactListCall.contactSayisi(acc.id );        
        system.assertEquals( 2 , sonuc);  
        
        Integer sonuc2 =   TestContactListCall.contactSayisi(acc2.id );        
        system.assertEquals( 0 , sonuc2);  
    } 
    
    //==================================================
    
    @isTest
    static void contListOfAccount(){
        
        Account acc = DataFactory.createAccount();
        insert acc;   
        
        contact cnt = DataFactory.createContact();
        cnt.AccountId= acc.id;
        insert cnt;
        
        List<Contact> cntList = TestContactListCall.contactListesi (acc.Id);
        
        System.assertEquals(1, cntList.size());
        
    } 
}