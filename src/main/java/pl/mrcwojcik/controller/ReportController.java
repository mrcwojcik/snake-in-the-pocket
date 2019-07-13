package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Category;
import pl.mrcwojcik.entity.Payer;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.BillRepository;
import pl.mrcwojcik.repositories.CategoryRepository;
import pl.mrcwojcik.repositories.PayerRepository;
import pl.mrcwojcik.service.BillService;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping ("/admin/report")
public class ReportController {

    @Autowired
    private BillRepository billRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private PayerRepository payerRepository;

    @Autowired
    private BillService billService;

    @GetMapping("/")
    public String allReports(Model model){
        model.addAttribute("bills", billRepository.findBillDate(3));
        return "report/all";
    }

    @GetMapping("/payer/{id}/{time}")
    public String showPayerReport(Model model, @PathVariable long id, @PathVariable int time){
        if (time == 0){
            model.addAttribute("reportBills", billRepository.findAllByPayerId(id));
        } else {
            model.addAttribute("reportBills", billRepository.findBillByDateAndPayer(id, time));

            BigDecimal valueOnPlus = billService.findPlusSUM(billRepository.findBillByDateAndPayerPLUS(id, time));
            BigDecimal valueOnMinus = billService.findMinusSUM(billRepository.findBillByDateAndPayerMINUS(id, time));

            model.addAttribute("valueOnMinus", valueOnMinus);
            model.addAttribute("valueOnPlus", valueOnPlus);
        }
        return "report/all";
    }

    @GetMapping("/category/{id}/{time}")
    public String showCategoryReport(Model model, @PathVariable long id, @PathVariable int time){
        if (time == 0){
            model.addAttribute("reportBills", billRepository.findAllByCategory(id));
        } else {
            model.addAttribute("reportBills", billRepository.findAllByDateAndCategory(id, time));
            model.addAttribute("valueOnMinus", billService.findMinusSUM(billRepository.findAllByDateAndCategoryMINUS(id, time)) );
            model.addAttribute("valueOnPlus", billService.findPlusSUM(billRepository.findAllByDateAndCategoryPLUS(id, time)));

        }
        return "report/all";
    }

    @GetMapping("/account/{id}/{time}")
    public String showAccountsReport(Model model, @PathVariable long id, @PathVariable int time){
        if (time == 0) {
            model.addAttribute("reportBills", billRepository.findAllByAccount_Id(id));
        } else {
            model.addAttribute("reportBills", billRepository.findAllByDateAndAccount(id, time));
            model.addAttribute("valueOnMinus", billService.findMinusSUM(billRepository.findAllByDateAndAccountMINUS(id, time)) );
            model.addAttribute("valueOnPlus", billService.findPlusSUM(billRepository.findAllByDateAndAccountPLUS(id, time)));
        }
        return "report/all";
    }

    @GetMapping("/mix/{payerId}/{categoryId}/{accountId}/{time}")
    public String showMixReport(Model model, @PathVariable long payerId, @PathVariable long categoryId, @PathVariable long accountId, @PathVariable int time){
        if (time == 0){
            model.addAttribute("reportBills", billRepository.findAllByMixCriteria(categoryId, payerId, accountId));
        } else {
            model.addAttribute("reportBills", billRepository.findAllByMixByDateCriteria(categoryId, payerId, accountId, time));
            model.addAttribute("valueOnMinus", billService.findMinusSUM(billRepository.findAllByMixCriteriaMINUS(categoryId, payerId, accountId, time)));
            model.addAttribute("valueOnPlus", billService.findPlusSUM(billRepository.findAllByMixCriteriaPLUS(categoryId, payerId, accountId, time)));
        }

        return "report/all";
    }


    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

    @ModelAttribute ("accounts")
    public List<Account> getAllUserAccounts(HttpSession httpSession){
        return accountRepository.findAllByUserId(getFromSession(httpSession).getId());
    }

    @ModelAttribute ("payers")
    public List<Payer> getAllPayers(){
        return payerRepository.findAll();
    }

    @ModelAttribute ("categories")
    public List<Category> getAllCategories(){
        return categoryRepository.findAll();
    }


}
