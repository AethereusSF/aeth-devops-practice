/**
 * @description       : 
 * @author            : RISHAB GOYAL
 * @group             : 
 * @last modified on  : 12-11-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PracticeSOQL {
    /**
    * @description 
    * @author ChangeMeIn@UserSettingsUnder.SFDoc | 12-11-2024 
    **/
    public static void PracticeSOQL() {
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts) FROM Account LIMIT 1];
        for (Account a : accounts) {
            System.debug('Account Name: ' + a.Name);
            for (Contact c : a.Contacts) {
                System.debug('Contact Last Name: ' + c.LastName);
            }
        }   
    }
}