trigger AccountTrigger on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    SWITCH on Trigger.operationType {
        
    WHEN AFTER_INSERT   { 
        
    List<Contact> newContactList = new List<Contact>();
        
      for(Account acc: Trigger.new){
          
            Contact cnt = new Contact();
          
            cnt.FirstName= 'Test ' + acc.name ;
            cnt.LastName= 'Last Name' ;
            cnt.AccountId = acc.Id;
            newContactList.add(cnt);
          }
        
      Database.insert(newContactList) ;
        
    }
}
}
/*
List <Account> accList = new List<Account>();

For( integer i=1 ; i <301 ; i++){

Account newAcc= new Account();

    newAcc.name = 'AAA-' + i;
    newAcc.BillingCity = 'Toronto';
    newAcc.BillingState = 'ON';
    newAcc.BillingCountry = 'CANADA';

accList.add(newAcc);
}

System.debug(accList.size() + ' account created');
Database.insert(accList);
*/
