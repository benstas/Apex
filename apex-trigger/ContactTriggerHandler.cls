public class ContactTriggerHandler {
	
    public static void sendMail(List<Contact> conList) {
        
        List<Messaging.Email> emailList = new List<Messaging.Email>(); 
            
        for(Contact con : conList) {
            
            if(con.Email != null) {
                // Class Messaging.SingleEmailMessage
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage(); 
                
                String[] toAdress = new String[]{con.Email}; 
                emailMsg.setToAddresses(toAdress); 
                
                String emailSub = 'Wellcome ' + con.FirstName;
                emailMsg.setSubject(emailSub); 
                
                String disName = 'Mustafa Senkaya'; 
                emailMsg.setSenderDisplayName(disName); 
                
                String content= 'Hi ' + con.FirstName + '<br><br>' +
                    'Wellcome to Salesforce Ecosystem <br><br>' + 
                    'How are you ne var you <br><br>';
                emailMsg.setHtmlBody(content);
                
                emailList.add(emailMsg); 
            }
        }
        Messaging.sendEmail(emailList);
    }
}

/*
List<Contact> conList new List<Contact>();

for(Integer i=1; i<=2; i++) {

	Contact con = new Contact(); 
	
	con.FirstName = 'Testing' + i; 
	con.LastName = 'Emaili' + i; 
	
    if(i == 1) {
    	con.Email = 'senkaya20@gmail.com';
    }else {
    	con.Email = 'm.senkaya7@gmail.com';
    }
	conList.add(con); 
}

insert conList; 
 */









