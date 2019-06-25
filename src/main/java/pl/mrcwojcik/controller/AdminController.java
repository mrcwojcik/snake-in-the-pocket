package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping ("/admin")
public class AdminController {

    @Autowired
    AccountRepository accountRepository;

    @GetMapping ("/dashboard")
    public String dashboard(){
        return "admin/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession){
        User user = getFromSession(httpSession);
        httpSession.setAttribute("loggedUser", user);
        httpSession.setMaxInactiveInterval(0);
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

}
