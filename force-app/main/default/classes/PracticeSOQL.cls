/**
 * @description       : 
 * @author            : RISHAB GOYAL
 * @group             : 
 * @last modified on  : 12-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class PracticeSOQL {
    public static void PracticeSOQL() {
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts) FROM Account LIMIT 1];
        for (Account a : accounts) {
            System.debug('Account Name: ' + a.Name);
            for (Contact c : a.Contacts) {
                System.debug('Contact Last Name: ' + c.LastName);
            }
        }   
    }

    public static Contact queryContactByEmailAddress(String email) { 
        Contact c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :email LIMIT 1];  
        return c;    
    } 

    public static Contact queryContactByName(String name) { 
        Contact c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE LastName = :name LIMIT 1];  
        return c;    
    } 
}