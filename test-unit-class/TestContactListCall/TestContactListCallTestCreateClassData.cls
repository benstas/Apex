@isTest
public class TestContactListCallTestCreateClassData {    
    
	@testSetup 
    static void setup(){
       
        Account acc = new Account();
            acc.Name = 'Test Account1';
            acc.Phone = '12345';
       	insert acc;
        
        Contact cnt1 = new Contact();
            cnt1.LastName = 'Test1';
            cnt1.AccountId = acc.Id;
      	insert cnt1;
        
        Contact cnt2 = new Contact();
            cnt2.LastName = 'Test2';
            cnt2.AccountId = acc.Id;
       	insert cnt2; 
        
        //---------------------------
        
        Account acc2 = new Account();
            acc2.Name = 'Test Account2';
            acc2.Phone = '123456';
       	insert acc2;
    }
    
    //===========================
    
 	@isTest
    static VOID contactSayisiTest(){
        
    Account acc = [SELECT Id FROM Account WHERE Phone = '12345' LIMIT 1];  
    
        INTEGER sonuc=   TestContactListCall.contactSayisi(acc.id );      
        system.assertEquals( 2 , sonuc);
    
  	Account acc2 = [SELECT Id FROM Account WHERE Phone = '123456' LIMIT 1];  
    
        INTEGER sonuc2 =   TestContactListCall.contactSayisi(acc2.id );      
        system.assertEquals( 0 , sonuc2);
          
    } 
    
    //=================================================
    
    @isTest
    static void contListOfAccount(){        
       
        Account acc = [SELECT Id FROM Account WHERE Phone = '12345' LIMIT 1];  
        
        List<Contact> cntList = TestContactListCall.contactListesi(acc.Id);
        
        System.assertEquals( 2 , cntList.size());
        //system.assertEquals(acc.id, cntList[0].AccountId);
    } 
}