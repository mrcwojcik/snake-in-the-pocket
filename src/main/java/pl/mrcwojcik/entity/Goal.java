package pl.mrcwojcik.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table (name = "goals")
public class Goal {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @OneToMany (mappedBy = "goal")
    private List<Account> accounts;

    private BigDecimal goalValue;

    public Goal() {
    }

    private BigDecimal getGoalStatus(){
        BigDecimal sum = getActualBalance();
        return goalValue.multiply(new BigDecimal(100)).divide(sum);
    }

    private BigDecimal getActualBalance(){
        BigDecimal sum = new BigDecimal(0);
        for (Account a : accounts){
            sum = sum.add(a.getActualBalance());
        }

        return sum;
    }

    private BigDecimal getDifference(){
        BigDecimal sum = getActualBalance();
        return sum.subtract(this.goalValue);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public BigDecimal getGoalValue() {
        return goalValue;
    }

    public void setGoalValue(BigDecimal goalValue) {
        this.goalValue = goalValue;
    }
}
