package pl.mrcwojcik.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table (name = "users")
public class User {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    @Size (max = 20)
    private String firstName;

    @Size (max = 20)
    private String lastName;

    @Column (unique = true)
    @Email (message = "Wpisz poprawnie adres e-mail")
    private String email;

    @NotEmpty (message = "Hasło nie może być puste")
    private String password;

    @AssertFalse
    private boolean superadmin;

    @OneToMany (mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<Account> accounts;

    @OneToMany (mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<Payer> payers;

    @OneToMany (mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<Goal> goals;

    public User() {
    }

    public List<Goal> getGoals() {
        return goals;
    }

    public boolean isSuperadmin() {
        return superadmin;
    }

    public void setSuperadmin(boolean superadmin) {
        this.superadmin = superadmin;
    }

    public void setGoals(List<Goal> goals) {
        this.goals = goals;
    }

    public List<Payer> getPayers() {
        return payers;
    }

    public void setPayers(List<Payer> payers) {
        this.payers = payers;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public String getFullName(){
        return this.firstName + " " + this.lastName;
    }
}
