public class ScheduleApexDeleteAccounts implements schedulable {
 	
    public void execute(SchedulableContext sc){
        // Her gün saat 03.00 de içinde AAA olan Account'ları sil. 
        list<Account> accList = [SELECT id FROM Account WHERE Name LIKE '%AAA%'];
        
        if(accList.size() > 0) {
            delete accList;
        }
    }
}
// Setup -> Custom Code -> Apex Classes
// https://www.freeformatter.com/cron-expression-generator-quartz.html 
 /*
ScheduleApexDeleteAccounts m = new ScheduleApexDeleteAccounts();
String sch = ' 0 0 3 ? * * *'; // Her gün saat 03.00
String jobID = System.schedule('Merge Job', sch, m);
*/
// Setup -> Jobs -> Scheduled Jobs