public class BatchApexOpportunity implements Database.Batchable<sObject> {
	
    Decimal allOppAmount = 0; 
    Decimal wonOppAmount = 0; 
    /*
     * Opportunitylerden tüm opportunitylerin ve tüm won olanların amountlarını email olarak 
     * atan batch apex'i yazıp bunu schedule ediniz. 
	*/
    public Database.QueryLocator start(Database.BatchableContext bc) {
                
        String query = 'SELECT Id, Amount, IsWon FROM Opportunity WHERE Amount != null';
        return Database.getQueryLocator(query);
        
        // return Database.getQueryLocator([SELECT Id, Name, Doctor_Name__c, Nurse_Name__c FROM Hasta__c]);
    }    
    
    
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList) {
        
        for(Opportunity opp: oppList) {
            
            if(opp.IsWon == true) {
                allOppAmount = allOppAmount + opp.Amount; 
                wonOppAmount = wonOppAmount + opp.Amount; 
            } else {
                allOppAmount = allOppAmount + opp.Amount; 
            }
        }
    }
    
    
    public void finish(Database.BatchableContext bc) {
        // https://www.greytrix.com/blogs/salesforce/2021/09/22/how-to-use-email-template-in-apex-code/ 
  		Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage(); 
        
        message.toaddresses = new String[]{'senkaya20@gmail.com'}; 
        message.optoutpolicy = 'FILTER'; 
        message.subject = 'Opportunity Amounts Info..'; 
        message.plaintextbody = 'Amount of total won opportunities: ' + wonOppAmount + 
            'Amount of total opportunities: ' + allOppAmount; 
        // message.templateid
        // Daha fazla email field bilgisi eklenebilir
        
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages); 
        
        if(results[0].success) {
            System.debug('The mail was sent successfully');
        } else {
            System.debug('The mail failed to send: ' + results[0].errors[0].message);
        }
    }

}
