package pl.mrcwojcik.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table (name = "accounts")
public class Account {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty
    private String accountName;

    @ManyToOne
    private Bank bank;

    @NotNull
    @DecimalMin("0")
    private BigDecimal startBalance;

    private BigDecimal actualBalance;

    @OneToMany (mappedBy = "account")
    private List<Bill> bills;

    @ManyToOne
    private Goal goal;

    @ManyToOne
    @NotNull
    private User user;

    public Account() {
    }

    @PrePersist
    public void setFirstActualBalance(){
        actualBalance = this.startBalance;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public BigDecimal getStartBalance() {
        return startBalance;
    }

    public void setStartBalance(BigDecimal startBalance) {
        this.startBalance = startBalance;
    }

    public BigDecimal getActualBalance() {
        return actualBalance;
    }

    public void setActualBalance(BigDecimal actualBalance) {
        this.actualBalance = actualBalance;
    }

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }

    public Goal getGoal() {
        return goal;
    }

    public void setGoal(Goal goal) {
        this.goal = goal;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
