@isTest
public class DataFactory {    
    
    public static Account createAccount(){
        // Account Oluşturur ama DML kullanılmaz.
        // İlişkilendirme zor olur.
        Account acc = new Account();
        
        acc.Name = 'Test';
        acc.BillingCountry ='Turkiye';
        acc.Phone ='123456789';
        
        return acc;
    }
    
    //--------------------------
    
    public static Contact createContact(){
        
        Contact cnt1 = new Contact();
        
        cnt1.LastName = 'Test';
        cnt1.MobilePhone='987654321';
        
        return cnt1;        
    }
    
    //--------------------------
   
    public static opportunity createOpp(){
        
        opportunity opp = new opportunity();
        
        opp.Name ='Test';
        opp.StageName = 'Prospecting';
        opp.CloseDate = date.today() +5;
        
        return opp;
    }    
}