public class OpportunityAfterInsertRecursionHandler { 
    
    public static Boolean flag = true; 
	
    public static void addOpp(List<Opportunity> opps) {   
        
            List<Opportunity> oppList = new List<Opportunity>();
            
            if(flag) {
                for(Opportunity newOpp : opps) {               
                    flag = false; 
                    Opportunity opp = new Opportunity(); 
                    
                    opp.Name = 'Recurdion Opp';
                    opp.CloseDate = System.today(); 
                    opp.StageName = 'Qualification'; 
                    
                    oppList.add(opp);                
                }
            }
            insert oppList;
        }

}