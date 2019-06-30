package pl.mrcwojcik.additionals;

import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Goal;

import java.util.List;

public class GoalCalculate {

    private List<Account> accounts;
    private Goal goal;

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
}
