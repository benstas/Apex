trigger AccountTriggerMultipleBeforeInsert on Account (before insert) {
	/*
		if an account is created
		No matter what the Rating of account should be 'Hot'
		and BillingState should ve 'Arkansas'
	*/
    
    for (Account newAcc : Trigger.new) {
        
        newAcc.Rating = 'Hot'; // Override
        newAcc.BillingState = 'Arkansas'; 
        newAcc.Type = 'Prospect';
    }
}

/*
List<Account> accList = new List<Account>(); 
    
Account acc1 = new Account(); 
acc1.Name = 'AAA ms 1'; 
acc1.Rating = 'Warm'; 
acc1.Phone = '5559995533'; 

Account acc2 = new Account(); 
acc2.Name = 'BBB ms 2'; 
acc2.Rating = 'Warm'; 
acc2.Phone = '5559995533'; 

accList.add(acc1);
accList.add(acc2);
    
insert accList; 

Collection limit 50000

-------------------------

HATALI KULLANIM

Account acc1 = new Account(); 
acc1.Name = 'AAA ms 1'; 
acc1.Rating = 'Warm'; 
acc1.Phone = '5559995533'; 
insert acc1;

Account acc2 = new Account(); 
acc2.Name = 'BBB ms 2'; 
acc2.Rating = 'Warm'; 
acc2.Phone = '5559995533';
insert acc2;

GOVERNER LIMIT 150

for (Integer i=0; i<200; i++) {
    Account acc = new Account(); 
    acc.Name = 'AAA ms ' + i; 
    acc.Rating = 'Warm'; 
    acc.Phone = '5559995533';
    insert acc;
}
System.LimitException: Too many DML statements: 151
*/
