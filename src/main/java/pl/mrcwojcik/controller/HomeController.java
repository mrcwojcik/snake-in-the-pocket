package pl.mrcwojcik.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.mrcwojcik.additionals.ContactMessage;
import pl.mrcwojcik.additionals.LoginAuth;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.UserRepository;
import pl.mrcwojcik.service.AuthenticationService;
import pl.mrcwojcik.service.EmailServiceImpl;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller("/")
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    EmailServiceImpl emailService;

    @GetMapping("/")
    public String showHomePage() {
        return "index";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerPOST(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        }
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginView(Model model) {
        model.addAttribute("loginAuth", new LoginAuth());
        return "login";
    }

    @PostMapping("/login")
    public String loginPOST(@ModelAttribute @Valid LoginAuth loginAuth, BindingResult result, HttpSession httpSession, Model model) {
        if (result.hasErrors()){
            return "login";
        }
        if (authenticationService.givenEmailExistInDb(loginAuth.getEmail())) {
            User user = authenticationService.authenticate(loginAuth.getEmail(), loginAuth.getPassword());
            if (user != null) {
                if (user.isSuperadmin()){
                    httpSession.setAttribute("superAdmin", user);
                    httpSession.setMaxInactiveInterval(2*60*60);
                    return "redirect:/superAdmin/";
                } else {
                    httpSession.setAttribute("loggedUser", user);
                    httpSession.setMaxInactiveInterval(2*60*60);
                    return "redirect:/admin/dashboard";
                }
            } else {
                model.addAttribute("errorTxt", "Podałeś złe hasło");
                return "login";
            }
        } else {
            model.addAttribute("errorTxt", "Nie ma takiego użytkownika w bazie");
            return "login";
        }
    }

    @GetMapping("/contact")
    public String contact(Model model){
        model.addAttribute("contactMessage", new ContactMessage());
        return "contact";
    }

    @PostMapping("/contact")
    public String contactPOST(@ModelAttribute ContactMessage contactMessage){
        String message = "Wiadomość od: " + contactMessage.getEmail() + " o treści: " + contactMessage.getMessage();
        emailService.sendSimpleMessage("maethi@gmail.com", contactMessage.getEmail(), contactMessage.getSubject(), message);
        return "redirect:/contact";
    }

    @GetMapping("/about")
    public String about(){
        return "about";
    }
}
