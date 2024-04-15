trigger AccountTrigger on Account (after insert) {
    
    try{
   		List<Contact> conList = new List<Contact>();
        for(Account acc : Trigger.New){
            if(acc.Create_Contact__c){
                Logger.info('INFO - For this Account Child contact should be created').addTag('INFO');
                Contact newCon = new Contact();
                newCon.LastName= acc.Contact_Name__c;
                newCon.Email=acc.Email__c;
                newCon.AccountId=acc.Id;
                conList.add(newCon);
            }  
        }
        Logger.debug('DEBUG conList'+conList).addTag('DEBUG');
        if(conList.size()>0){
            insert conList;
            Logger.fine('FINE:: Contact Successfully Created').addTag('Fine');
        }
        Logger.saveLog();
    }
    catch(Exception ex){
        //System.debug('Exception>>'+ex.getMessage());
        Logger.error('ERROR::'+ex.getMessage());
        Logger.saveLog();
    }
    
}