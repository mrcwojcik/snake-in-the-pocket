package pl.mrcwojcik.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.entity.Goal;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.GoalRepository;
import pl.mrcwojcik.repositories.UserRepository;
import pl.mrcwojcik.service.BillService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping ("/admin")
public class AdminController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BillService billService;

    @Autowired
    private GoalRepository goalRepository;

    @GetMapping ("/dashboard")
    public String dashboard(){
        return "admin/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession){
        User user = getFromSession(httpSession);
        httpSession.setAttribute("loggedUser", null);
        return "redirect:/";
    }

    @GetMapping("/profile")
    public String profilDetails(Model model, HttpSession httpSession){
        model.addAttribute("user", getFromSession(httpSession));
        return "admin/profile";
    }

    @PostMapping("/profile")
    public String editProfile(@ModelAttribute @Valid User user, BindingResult result, HttpSession httpSession){
        if (result.hasErrors()){
            return "admin/profile";
        }

        userRepository.save(user);
        httpSession.setAttribute("loggedUser", user);
        return "redirect:/admin/profile";
    }

    @GetMapping("/pass")
    public String changePass(Model model, HttpSession httpSession){
        model.addAttribute("user", getFromSession(httpSession));
        return "admin/pass";
    }

    @PostMapping("/pass")
    public String changePassPost(@ModelAttribute @Valid User user, @RequestParam String checkNewPass, BindingResult result, Model model){
        if (result.hasErrors()){
            return "admin/pass";
        }

        if (!user.getPassword().equals(checkNewPass)){
            model.addAttribute("info", "Hasła się nie zgadzają");
            return "admin/pass";

        }
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:/admin/profile";
    }

    @GetMapping("/delete")
    public String deleteAccount(){
        return "admin/deleteConfirm";
    }

    @GetMapping("/deleteConfirm/{id}")
    public String deleteConfirm(@PathVariable Long id, HttpSession httpSession){
        User user = userRepository.findById(id).get();
        userRepository.delete(user);
        httpSession.setAttribute("loggedUser", null);
        return "redirect:/";
    }


    @ModelAttribute ("accounts")
    public List<Account> getAllUserAccounts(HttpSession httpSession){
        return accountRepository.findAllByUserId(getFromSession(httpSession).getId());
    }

    public User getFromSession(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return user;
    }

    @ModelAttribute("allBills")
    public List<Bill> getBillsByUser(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        List<Account> accounts = accountRepository.findAllByUserId(user.getId());
        return billService.getUserBills(accounts);
    }

    @ModelAttribute("goals")
    public List<Goal> getGoals(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return goalRepository.findAllByUserId(user.getId());
    }

}
