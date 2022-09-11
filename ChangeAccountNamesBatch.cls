/**
 * Created by ASUS on 12.09.2022.
 */

public with sharing class ChangeAccountNamesBatch implements Database.Batchable<sObject>{
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
                'SELECT ID, Name FROM Account '
        );
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        List<Account> accounts = new List<Account>();
        for (Account account : scope){
            account.Name = account.Name + 'Batch Processed';
            accounts.add(account);
            recordsProcessed = recordsProcessed + 1;
        }
        update accounts;
    }

    public void finish(Database.BatchableContext bc ) {
        System.debug(recordsProcessed + ' records processed.');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
                JobItemsProcessed,
                TotalJobItems, CreatedBy.Email
        FROM AsyncApexJob
        WHERE Id = :bc.getJobId()];

    }


}