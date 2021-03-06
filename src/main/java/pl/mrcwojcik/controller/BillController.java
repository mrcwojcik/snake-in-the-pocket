package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrcwojcik.entity.*;
import pl.mrcwojcik.repositories.*;
import pl.mrcwojcik.service.AccountService;
import pl.mrcwojcik.service.BillService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
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

    @Autowired
    private AccountService accountService;

    @Autowired
    private BillService billService;

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

    @GetMapping("/add/{accountId}")
    public String addBillToAccount(@PathVariable("accountId") Long accountId, Model model){
        model.addAttribute("bill", new Bill());
        model.addAttribute("account", accountRepository.findById(accountId).get());
        return "bill/addBill";
    }

    @PostMapping("/add/{accountId}")
    public String addBillToAccountPOST(@ModelAttribute @Valid Bill bill, BindingResult result){
        if (result.hasErrors()){
            return "bill/addBill";
        }

        Bill newBill = billRepository.save(bill);
        return "redirect:/admin/transaction/addDetails/" + newBill.getId();
    }

    @GetMapping("/addDetails/{id}")
    public String addBillDetails(@PathVariable Long id, Model model){
        if (billRepository.findById(id).isPresent()){
            model.addAttribute("bill", billRepository.findById(id).get());
        }
        model.addAttribute("billDetails", new BillDetails());
        return "bill/addDetails";
    }

    @PostMapping("/addDetails/{id}")
    public String addBillDetailsPOST(@ModelAttribute @Valid BillDetails billDetails, BindingResult result){
        if (result.hasErrors()){
            return "bill/addDetails";
        }

        if (billDetailsRepository.findByCategoryIdAndBill_Id(billDetails.getCategory().getId(), billDetails.getBill().getId()) != null){
            BillDetails existDetails = billDetailsRepository.findByCategoryIdAndBill_Id(billDetails.getCategory().getId(), billDetails.getBill().getId());
            existDetails.addValue(billDetails.getValue());
            billDetailsRepository.save(existDetails);
            return "redirect:/admin/transaction/addDetails/" + existDetails.getBill().getId();
        }

        BillDetails newDetails = new BillDetails();
        newDetails.setValue(billDetails.getValue());
        newDetails.setBill(billDetails.getBill());
        newDetails.setCategory(billDetails.getCategory());
        billDetailsRepository.save(newDetails);

//        BillDetails details = billDetailsRepository.save(billDetails);
        return "redirect:/admin/transaction/addDetails/" + newDetails.getBill().getId();
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

    @GetMapping("/bills/account/{accountId}")
    public String showAccountBills(@PathVariable long accountId, Model model){
        model.addAttribute("bills", billRepository.findAllByAccount_Id(accountId));
        return "bill/all";
    }

    @GetMapping("/bills/payer/{payerId}")
    public String showPayerBills(@PathVariable long payerId, Model model){
        model.addAttribute("bills", billRepository.findAllByPayerId(payerId));
        return "bill/all";
    }

    @GetMapping("/bills/plusOrMinus/{bool}")
    public String showAllByPlusOrMinus(@PathVariable boolean bool, Model model){
        model.addAttribute("bills", billRepository.findBillByPlusOrMinus(bool));
        return "bill/all";
    }

    @GetMapping("/delete/{id}")
    public String deleteBill(@PathVariable long id){
        accountService.changeActualBalance(id);
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

    @ModelAttribute("allBills")
    public List<Bill> getBillsByUser(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        List<Account> accounts = accountRepository.findAllByUserId(user.getId());
        return billService.getUserBills(accounts);
    }

    @ModelAttribute("payers")
    public List<Payer> getPayers(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return payerRepository.findAllByUserId(user.getId());
    }

    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

    @ModelAttribute ("accounts")
    public List<Account> getAllUserAccounts(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return accountRepository.findAllByUserId(user.getId());
    }
}
