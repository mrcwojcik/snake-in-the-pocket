package pl.mrcwojcik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.entity.BillDetails;
import pl.mrcwojcik.repositories.BillDetailsRepository;
import pl.mrcwojcik.repositories.BillRepository;

import java.math.BigDecimal;
import java.util.List;

@Service
public class BillService {

    @Autowired
    BillRepository billRepository;

    @Autowired
    BillDetailsRepository billDetailsRepository;

    public BigDecimal findPlusSUM(List<Bill> bills){
        BigDecimal sum = BigDecimal.ZERO;
        for(Bill b : bills){
            sum = sum.add(b.getBillValue());
        }

        return sum;
    }

    public BigDecimal findMinusSUM(List<Bill> bills){
        BigDecimal sum = BigDecimal.ZERO;

        for (Bill b : bills){
            sum = sum.subtract(b.getBillValue());
        }

        return sum;
    }

    public void saveDetailsToBills(BillDetails billDetails){
        if (checkExistDetails(billDetails)){
            changeValueInExistingDetails(billDetails);
        } else {
            billDetailsRepository.save(billDetails);
        }
    }

    public boolean checkExistDetails(BillDetails billDetails){
        for (BillDetails bd : billDetails.getBill().getBillDetails()) {
            if (bd.getCategory().equals(billDetails.getCategory())) {
                System.out.println(true);
                return true;
            }
        }

        System.out.println(false);
        return false;
    }

    public void changeValueInExistingDetails(BillDetails billDetails){
        for (BillDetails bd : billDetails.getBill().getBillDetails()) {
            if (bd.getCategory().equals(billDetails.getCategory())) {
                bd.setValue(bd.getValue().add(billDetails.getValue()));
                System.out.println("done");
            }
        }
    }

}


