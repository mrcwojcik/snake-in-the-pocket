package pl.mrcwojcik.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table (name = "billDetails")
public class BillDetails {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Category category;
    private BigDecimal value;

    @ManyToOne
    private Bill bill;

    public BillDetails() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }
}
