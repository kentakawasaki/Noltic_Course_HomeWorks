/**
 * Created by ASUS on 16.07.2022.
 */

public with sharing class HomeWork9 {
    public static List<String>  Task1(List<String> MyList){
        Set<String> mySet = new Set<String>(MyList);
        MyList.clear();
        for(String temp:mySet){
            MyList.add(temp);
        }
        return MyList;
    }
    public static String Task2(String Name,List<Contact> contact){
        for(Contact contacts:contact){
            if(contacts.FirstName == Name){
                return contacts.FirstName;
            }
        }
        return 'this contact is not in the list';
    }
    public static Decimal Task3(List<Opportunity> Opportunityes){
        Decimal temp = 0;
        for(Opportunity opp:Opportunityes) {
            if(opp.Amount > temp){
                temp = opp.Amount;
            }
        }
        for(Opportunity opp:Opportunityes) {
            if (temp == opp.Amount) {
                return opp.Amount;
            }
        }

        return null;
    }
    public static List<Integer> Task4(Integer Mynumber){
        List<Integer> Digits = new List<Integer>();
        List<Integer> ReverseDigits = new List<Integer>();
        while (Mynumber > 0){
            ReverseDigits.add(math.mod(Mynumber,10));
            Mynumber = Mynumber / 10;
        }
        for(Integer i = ReverseDigits.size() - 1; i >= 0; i--){
            Digits.add(ReverseDigits[i]);
        }
        return Digits;
    }

}