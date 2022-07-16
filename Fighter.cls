/**
 * Created by ASUS on 12.07.2022.
 */

public class Fighter {
    public String name;
    public Integer health;
    public Integer damagePerAttack;

    public Fighter(String name, Integer health, Integer damagePerAttack) {
        this.name = name;
        this.health = health;
        this.damagePerAttack = damagePerAttack;
    }
    public static String FightWinner(Fighter fighter1, Fighter fighter2){
        String Winner;
        while (fighter1.health > 0 && fighter2.health > 0){
            fighter2.health = fighter2.health - fighter1.damagePerAttack;
            if(fighter2.health <= 0){
                return fighter1.name;
            }
            fighter1.health = fighter1.health - fighter2.damagePerAttack;
            if(fighter1.health <= 0){
                return fighter2.name;
            }
        }
        return Winner;
    }
}