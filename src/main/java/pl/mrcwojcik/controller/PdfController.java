package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.BillRepository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping ("/admin/generate")
public class PdfController {

    @Autowired
    BillRepository billRepository;

    @Autowired
    AccountRepository accountRepository;

    @GetMapping("/pdf")
    public ModelAndView downloadPdf(HttpSession httpSession){
        List<Account> accounts = accountRepository.findAllByUserId(getFromSession(httpSession).getId());
        List<Bill> bills = new ArrayList<>();
        for (Account a : accounts){
            for (Bill bill : a.getBills()){
                bills.add(bill);
            }
        }
        return new ModelAndView("pdfView", "billsToPdf", bills);
    }

    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }



}
