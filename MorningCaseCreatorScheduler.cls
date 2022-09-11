/**
 * Created by ASUS on 12.09.2022.
 */

public with sharing class MorningCaseCreatorScheduler implements Schedulable {

    public void execute(SchedulableContext param1) {
        Case MorningCase = new Case();
        String sch = '0 0 7 * * ? ';
        String jobID = System.schedule('Morning Case - dd/mm/yyyy', sch,MorningCase);
    }
}