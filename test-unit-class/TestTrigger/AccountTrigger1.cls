trigger AccountTrigger1 on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
    /*
    Account insert edildiğinde isminin sonuna INSERTED eklenecek. 
	Account -> before insert

    Account update edildiğinde isminin sonuna UPDATED eklenecek.  

    */
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
            
            for(Account newAcc : Trigger.new) {
                newAcc.Name = newAcc.Name + ' INSERTED'; 
            }
        }
        
        WHEN BEFORE_UPDATE  { 
            
         for(Account newAcc : Trigger.new) {
                newAcc.Name = newAcc.Name + ' UPDATED'; 
            }
        }
        /*
        WHEN BEFORE_DELETE  { }        
        WHEN AFTER_INSERT   { }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }  
 		*/
    } 
}