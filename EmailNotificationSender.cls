/**
 * Created by ASUS on 03.09.2022.
 */

public with sharing class EmailNotificationSender implements NotificationSender{

    public void sendNotification(String notificationMessage) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {UserInfo.getUserEmail()};
        String[] ccAddresses = new String[] {'viktormanko2003@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        mail.setPlainTextBody('Your massage: ' + notificationMessage );

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }
}