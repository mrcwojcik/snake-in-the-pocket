package pl.mrcwojcik.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table (name = "payers")
public class Payer {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @ManyToOne
    private User user;

    @OneToMany (mappedBy = "payer")
    private List<Bill> bills;

    public Payer() {
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }
}
