package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Bank;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.BankRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.groups.Default;
import java.util.List;

@Controller
@RequestMapping("/admin/account")
public class AccountController {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    BankRepository bankRepository;

    @GetMapping("/add")
    public String addAccountView(Model model, HttpSession httpSession) {
        model.addAttribute("account", new Account());
        return "account/add";
    }

    @PostMapping("/add")
    public String addAccountPOST(@ModelAttribute @Valid Account account, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "account/add";
        }
        account.setUser(getFromSession(session));
        accountRepository.save(account);
        return "redirect:/admin/dashboard";
    }

    @ModelAttribute("banks")
    public List<Bank> getBankList() {
        return bankRepository.findAll();
    }

    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

}
