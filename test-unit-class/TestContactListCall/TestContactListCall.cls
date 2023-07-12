public class TestContactListCall {
	
    public static Integer contactSayisi(Id accId) {
        
        List<contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId =:accId]; 
        
        if(conList.size() > 0) {
             return conList.size(); 
        } else {
            return 0;    
        }
       
    } 
    
    //---------------------------------------
    
    public static List<contact> contactListesi(Id accId) {
        
        List<contact> conList = [SELECT Id, AccountId FROM Contact WHERE AccountId =:accId];  
        
        return conList;   
    }
}