package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
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
    private AccountRepository accountRepository;

    @Autowired
    private BankRepository bankRepository;

    @GetMapping("/")
    public String allAcounts(){
        return "account/all";
    }

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

    @GetMapping("/edit/{id}")
    public String editAccountView(@PathVariable Long id, Model model){
        model.addAttribute("account", accountRepository.findById(id).get());
        return "account/edit";
    }

    @PostMapping("/edit/{id}")
    public String editAccountPOST(@ModelAttribute @Valid Account account, BindingResult result){
        if (result.hasErrors()){
            return "account/edit";
        }

        accountRepository.save(account);
        return "redirect:/admin/account/";
    }

    @GetMapping("/delete/{id}")
    public String deleteAccount(@PathVariable Long id, Model model){
        model.addAttribute("id", id);
        return "account/deleteConfirm";
    }

    @GetMapping("/deleteConfirm/{id}")
    public String deleteConfirm(@PathVariable Long id){
        accountRepository.delete(accountRepository.findById(id).get());
        return "redirect:/admin/account/";
    }

    @ModelAttribute("banks")
    public List<Bank> getBankList() {
        return bankRepository.findAll();
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
