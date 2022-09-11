
public with sharing class createAccount {
    @future(callout=true)
    public static void createAccountFuture(String accountName){
        insert new Account(Name = accountName);
    }
}