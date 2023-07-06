public class QueueableOrnek implements Queueable {
    
    public void execute(QueueableContext context) {
        
       	List<Account> accList = [SELECT id, ParentId FROM Account];
        
        Account wise = [SELECT ID FROM Account WHERE Name LIKE 'Wisequarter'  LIMIT 1];
        
        // List<Account> accListSon = [SELECT id FROM account WHERE id !=:wise.id ];
        
        for(Account acc : accList ){
            if(acc.id != wise.id ){
                acc.ParentId = wise.id;
            }
        }
        
       update accList;
    }
}
/*
QueueableOrnek armut = new QueueableOrnek();
ID jobID = System.enqueueJob(armut);
*/