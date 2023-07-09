public class ScheduleBatchApexOpportunity implements schedulable {
	
    public void execute(SchedulableContext sc){
        
        BatchApexOpportunity m = new BatchApexOpportunity();
        Database.executeBatch(m); 
    }
}

 /*
-> https://www.freeformatter.com/cron-expression-generator-quartz.html 

ScheduleApexDeleteAccounts m = new ScheduleApexDeleteAccounts();
String sch = '0 0 0 ? * 6L *'; // Her ayın son Cuma günü
String jobID = System.schedule('Merge Job', sch, m);
*/
