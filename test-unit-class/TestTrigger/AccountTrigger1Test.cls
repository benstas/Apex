@isTest
public class AccountTrigger1Test {
	
    @isTest
    static void AccountTrigger1BeforeInsertTest(){
        // Trigger Account oluşturduğunda şeklinde
        // Bu sebeple Account oluşturacağız
        Account acc = DataFactory.createAccount(); 
		insert acc;   
        // acc.Name = 'Test'; factory'de tanımlı oluşur.          
        // Trigger ile sonuna 'Test INSERTED' eklenir. 
        // Trigger ile oluşan isim query ile DB'den alınır. 
        Account accFromDb = [SELECT Id, Name FROM Account WHERE Id =: acc.Id]; 
        System.assertEquals('Test INSERTED', accFromDb.Name);   
    }
    
     @isTest
    static void AccountTrigger1BeforeUpdateTest(){
        
        Account acc = DataFactory.createAccount(); 
		insert acc; 
        
        Account acc2 = [SELECT Id, Name FROM Account WHERE Id =: acc.Id]; 
        acc2.Rating = 'Cold'; 
        Update acc2; 
        
        Account accFromDb = [SELECT Id, Name FROM Account WHERE Id =: acc2.Id]; 
        System.assertEquals('Test INSERTED UPDATED', accFromDb.Name);  
    }
}