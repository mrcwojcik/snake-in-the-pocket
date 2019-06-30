package pl.mrcwojcik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.BillRepository;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private BillRepository billRepository;

    public void changeActualBalance(Long billId){
        Bill billToDelete = billRepository.findById(billId).get();
        Account account = billToDelete.getAccount();
        if (billToDelete.isPlusOrMinus()){
            account.subtractionActualBalance(billToDelete.getBillValue());
        } else {
            account.addActualBalance(billToDelete.getBillValue());
        }

        accountRepository.save(account);
        billRepository.delete(billRepository.findById(billId).get());
    }




}
