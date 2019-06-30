package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.jsf.FacesContextUtils;
import pl.mrcwojcik.entity.*;
import pl.mrcwojcik.repositories.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/admin/transaction")
public class BillController {

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private PayerRepository payerRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private BillDetailsRepository billDetailsRepository;

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/")
    public String allBills(){
        return "bill/all";
    }

    @GetMapping("/add")
    public String addBill(Model model){
        model.addAttribute("bill", new Bill());
        return "bill/addBill";
    }

    @PostMapping("/add")
    public String addBillPOST(@ModelAttribute @Valid Bill bill, BindingResult result){
        if (result.hasErrors()){
            return "bill/addBill";
        }

        Bill newBill = billRepository.save(bill);
        return "redirect:/admin/transaction/addDetails/" + newBill.getId();
    }

    @GetMapping("/addDetails/{id}")
    public String addBillDetails(@PathVariable Long id, Model model){
        model.addAttribute("bill", billRepository.findById(id).get());
        model.addAttribute("billDetails", new BillDetails());
        return "bill/addDetails";
    }

    @PostMapping("/addDetails/{id}")
    public String addBillDetailsPOST(@ModelAttribute @Valid BillDetails billDetails, BindingResult result){
        if (result.hasErrors()){
            return "bill/addDetails";
        }

        BillDetails details = billDetailsRepository.save(billDetails);
        return "redirect:/admin/transaction/addDetails/" + details.getBill().getId();
    }

    @GetMapping("/endOfAdding/{id}")
    public String endOfAdding(@PathVariable long id){
        Bill bill = billRepository.findById(id).get();
        Account account = accountRepository.findById(bill.getAccount().getId()).get();

        if (bill.isPlusOrMinus()){
            account.addActualBalance(bill.getBillValue());
        } else {
            account.subtractionActualBalance(bill.getBillValue());

        }

        accountRepository.save(account);
        return "redirect:/admin/transaction/";
    }

    @GetMapping("/billDetails/{id}")
    public String showBillDetails(@PathVariable long id, Model model){
        model.addAttribute("billDetails", billDetailsRepository.findByBillId(id));
        model.addAttribute("bill", billRepository.findById(id).get());
        return "bill/billDetails";
    }

    @GetMapping("/delete/{id}")
    public String deleteBill(@PathVariable long id){
        Bill billToDelete = billRepository.findById(id).get();
        Account account = billToDelete.getAccount();
        if (billToDelete.isPlusOrMinus()){
            account.subtractionActualBalance(billToDelete.getBillValue());
        } else {
            account.addActualBalance(billToDelete.getBillValue());
        }

        accountRepository.save(account);
        billRepository.delete(billRepository.findById(id).get());
        return "redirect:/admin/transaction/";
    }

    @GetMapping("/deleteDetails/{billId}/{detailId}")
    public String deleteDetails(@PathVariable long billId, @PathVariable long detailId){
        billDetailsRepository.delete(billDetailsRepository.findById(detailId).get());
        return "redirect:/admin/transaction/billDetails/" + billId;
    }

    @GetMapping("/deleteDetailsInAdd/{billId}/{detailId}")
    public String deleteDetailsInAdd(@PathVariable long billId, @PathVariable long detailId){
        billDetailsRepository.delete(billDetailsRepository.findById(detailId).get());
        return "redirect:/admin/transaction/addDetails/" + billId;
    }

    @ModelAttribute("categories")
    public List<Category> getCategories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("bills")
    public List<Bill> getBillsByUser(){
        return billRepository.findAll();
    }

    @ModelAttribute("payers")
    public List<Payer> getPayers(){
        return payerRepository.findAll();
    }

    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

    @ModelAttribute ("accounts")
    public List<Account> getAllUserAccounts(HttpSession httpSession){
        return accountRepository.findAllByUserId(getFromSession(httpSession).getId());
    }
}
