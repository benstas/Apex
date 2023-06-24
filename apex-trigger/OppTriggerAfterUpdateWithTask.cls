trigger OppTriggerAfterUpdateWithTask on Opportunity (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
    
    WHEN AFTER_UPDATE   { 
        
        List<Task> taskList = new List<Task>(); 
        
        for (Opportunity newOpp : Trigger.new){                
            Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id); 

            if(newOpp.StageName == 'Negotiation/Review' && oldOpp.StageName != 'Negotiation/Review') {
                
                Task task = new Task();
                
                task.OwnerId = newOpp.OwnerId; 
                task.Subject = 'Opp Stage Negotiation Task'; 
                task.Priority = 'Normal';
                task.Status = 'Not Started'; 
                task.ActivityDate = System.today() + 3; // Due Date
                //task.WhoId = newLead.Id; 
                task.WhatId = newOpp.Id; 
                                        
                taskList.add(task);
            }                
        }
        insert taskList; 
    }
}
}