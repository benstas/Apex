@isTest
public class TestContactListCallTestDataFactory {
	
    @isTest
    static Void contactSayisiTest(){
        
        Account acc = DataFactory.createAccount();
        /*  Account acc = new Account();
            acc.Name = 'Test';
            acc.BillingCountry ='Turkiye';
            acc.Phone ='123456789';
		*/        
        acc.Phone='8987633';
        acc.Fax = 'agdjsgds';
        insert acc;
        
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