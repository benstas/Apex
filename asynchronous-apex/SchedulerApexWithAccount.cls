public class SchedulerApexWithAccount implements schedulable {
    
    public void execute(SchedulableContext sc){
   		/*
            Everyday check if there is account 'AAA' in the name 
			if so delete all account which 'AAA' in the name. 
        */
        /*
        List<Account> accList = [SELECT id, Name FROM Account WHERE  Name LIKE '%AAA%'];    
        
         if(accList.size() > 0) {
             
            try{
                delete accList;
            }
             catch(Exception e ){
                system.debug(' exception -->> ' + e.getMessage());
            }      
             
         }
        */
        
        BatchApexWithAccount obj = new BatchApexWithAccount(); 
		Id batchId = Database.executeBatch(obj);
    }
}
// -> https://www.freeformatter.com/cron-expression-generator-quartz.html 
/*
SchedulerApexWithAccount m = new SchedulerApexWithAccount();
String sch = '0 0 0 ? * SUN,MON,TUE,WED,THU,FRI,SAT *'; // Her gün saat 00.00
String jobID = System.schedule('Merge Job 1', sch, m);
*/
