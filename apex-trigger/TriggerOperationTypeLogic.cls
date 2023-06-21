trigger AccountTriggerOperationType on Account (before insert, after insert) {
	
    System.debug('Code çalıştı..'); // Code çalıştı..
    
    System.debug('Trigger.isBefore => ' + Trigger.isBefore); // Trigger.isBefore => true
    System.debug('Trigger.isAfter => ' + Trigger.isAfter); // Trigger.isAfter => false
    
    System.debug('Trigger.isInsert => ' + Trigger.isInsert); // Trigger.isInsert => true
    System.debug('Trigger.isUpdate => ' + Trigger.isUpdate); // Trigger.isUpdate => false
    
    System.debug('Trigger.operationType => ' + Trigger.operationType); // Trigger.operationType => BEFORE_INSERT
    
    // Kodlar 2 defa çalışır. yani 6 + 6 = 12 defa çalışır. 
}

/*
Account acc = new Account(); 
acc.name = 'AAA Deneme'; 
acc.Rating = 'Warm';

insert acc; 
*/