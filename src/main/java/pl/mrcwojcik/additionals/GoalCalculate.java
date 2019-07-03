package pl.mrcwojcik.additionals;

import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Goal;

import java.math.BigDecimal;
import java.util.List;

public class GoalCalculate {

    private List<Account> accounts;
    private Goal goal;
    private int time;
    private BigDecimal contribution;

    public GoalCalculate() {
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public Goal getGoal() {
        return goal;
    }

    public void setGoal(Goal goal) {
        this.goal = goal;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public BigDecimal getContribution() {
        return contribution;
    }

    public void setContribution(BigDecimal contribution) {
        this.contribution = contribution;
    }
}
