package pl.mrcwojcik.entity;

import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table (name = "bills")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Payer payer;

    private boolean plusOrMinus;

    @CreatedDate
    private LocalDateTime created;

    @OneToMany (mappedBy = "bill")
    private List<BillDetails> billDetails;

    @ManyToOne
    private Account account;

    public Bill() {
    }

    public BigDecimal getBillValue(){
        BigDecimal sum = new BigDecimal(0);
        for (BillDetails bd : billDetails){
            sum = sum.add(bd.getValue());
        }

        return sum;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Payer getPayer() {
        return payer;
    }

    public void setPayer(Payer payer) {
        this.payer = payer;
    }

    public boolean isPlusOrMinus() {
        return plusOrMinus;
    }

    public void setPlusOrMinus(boolean plusOrMinus) {
        this.plusOrMinus = plusOrMinus;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public List<BillDetails> getBillDetails() {
        return billDetails;
    }

    public void setBillDetails(List<BillDetails> billDetails) {
        this.billDetails = billDetails;
    }
}
