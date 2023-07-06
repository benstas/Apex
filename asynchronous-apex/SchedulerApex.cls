public class SchedulerApex implements schedulable {
 	
    public void execute(SchedulableContext sc){
   		/*
            Create( Query ) a list for open Opportunities that should have closed by the current date
            And
            Creates a task on each one to remind the owner to update the opportunity
        */
        List<Opportunity> oppList = [SELECT id, OwnerId FROM Opportunity WHERE  CloseDate < TODAY AND isClosed = False ];
        
         if(oppList.size() > 0) {
             
            List<Task> yenitask = new List<Task>();
             
            for (Opportunity opp : oppList) {
                
                Task tsk = new Task();
                
                tsk.Subject = 'Opp Close date Passed';
                //   tsk.Status = 'Not Started';
                tsk.WhatId = opp.id;
                tsk.OwnerId = opp.OwnerId;
                tsk.ActivityDate = Date.today() + 3 ; // DueDate
                
                yenitask.add(tsk);
            }
             
            try{
                insert yenitask;
            }
             catch(Exception e ){
                system.debug(' exception -->> ' + e.getMessage());
            }
             
         }
    }
}

/*
SchedulerApex m = new SchedulerApex();
String sch = '0 22 18 6 JUL ? *'; // 6 JUL 18:22
String jobID = System.schedule('Merge Job', sch, m);
*/











