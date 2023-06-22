trigger AccountTriggerRecursion on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
	/*	After Insert
	 	Generate a trigger that After creating a new Account, 
        creates another Account (FirstName=’AAA new Lead Created’) 
        Account -> Account -> Account -> 
	 */

	SWITCH on Trigger.operationType {
        
		WHEN AFTER_INSERT   { 
            
            AccountTriggerHandler.recurtionExample(trigger.new); 
        }
    }
}
/*
Account acc = new Account(); 
acc.Name = 'Mahmut';
insert acc;
*/

