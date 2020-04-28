public with sharing class Record_Locker_Extension {
    public string password{get;set;}
    public boolean locked{get;set;}
    public Account Acc;
    public Record_Locker_Extension(ApexPages.StandardController controller) {
        if(!Test.isRunningTest())
            controller.addFields(new list<string>{'Password__c', 'Locked__c', 'OwnerId'});
        Acc = (Account)controller.getRecord();
        locked = Acc.Locked__c && Acc.OwnerId != UserInfo.getUserId();
    }
    
    public void unlock(){
        locked = !(Acc.Password__c == Password);
        if(locked)
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Password is not correct!'));
    }

}