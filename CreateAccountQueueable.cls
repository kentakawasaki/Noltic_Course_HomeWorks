/**
 * Created by ASUS on 12.09.2022.
 */

public with sharing class CreateAccountQueueable implements Queueable {
    private List<Account> accounts;
    private String AccNAME;
    public CreateAccountQueueable(List<Account> records,String AccName){
        this.accounts = records;
        this.AccNAME = AccNAME;
    }
    public void execute(QueueableContext context) {
        for (Account account : accounts) {
            account.Name = AccNAME;
        }
        insert accounts;
    }
}