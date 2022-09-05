/**
 * Created by ASUS on 03.09.2022.
 */

public with sharing class ObjectNotificationSender implements NotificationSender{

    public void sendNotification(String notificationMessage) {
        List<Notification__c> CreateList = new List<Notification__c>();
        Notification__c nm = new Notification__c(Notification_Message__c=notificationMessage);
        CreateList.add(nm);
        insert CreateList;

    }
}