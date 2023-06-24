trigger LeadTriggerAfterInsertWithTask on Lead (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
    
    SWITCH on Trigger.operationType {
  
        WHEN AFTER_INSERT   { 
            
            List<Task> taskList = new List<Task>();
            
            for(Lead newLead : Trigger.new) {
                
                Task task = new Task();      
                
                task.OwnerId = newLead.OwnerId; 
                task.Subject = 'Lead Task Deneme'; 
                task.Priority = 'Normal';
                task.Status = 'Not Started'; 
                task.ActivityDate = System.today() + 3; // Due Date
                task.WhoId = newLead.Id; 
                //task.WhatId=''; 
                
                // WhoId -> User (lead or contact)
                // WhatId -> Object
                taskList.add(task);
            }
            insert taskList; 
        }
 
    }
}