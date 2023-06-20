trigger AccountTriggerSingleBeforeInsert on Account (before insert) {
	/*
		if an account is created
		No matter what the Rating of account should be 'Hot'
		and BillingState should ve 'Arkansas'
	*/
    // System.debug('First Trigger Code..');
    
    for (Account newAcc : Trigger.new) {
        
        newAcc.Rating = 'Hot'; // Override
        newAcc.BillingState = 'Arkansas'; 
        newAcc.Type = 'Prospect';
    }
}
	/*
		Object (account)
		before/after (before)
		DML -> insert/update/delete/undelete (insert)
		
		Logs ile işlemler takip edilir.

		DEBUG
        Account acc1 = new Account(); 
        
        acc1.Name = 'AAA ms'; 
        acc1.Rating = 'Warm'; 
        acc1.Phone = '5559995533'; 
        
        insert acc1; 
	*/