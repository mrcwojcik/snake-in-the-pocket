package pl.mrcwojcik.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.mrcwojcik.additionals.LoginAuth;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.UserRepository;
import pl.mrcwojcik.service.AuthenticationService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller("/")
public class HomeController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    private AuthenticationService authenticationService;

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
    public String loginPOST(@ModelAttribute LoginAuth loginAuth, BindingResult result, HttpSession httpSession) {
        if (result.hasErrors()){
            return "login";
        }
        if (authenticationService.givenEmailExistInDb(loginAuth.getEmail())) {
            User user = authenticationService.authenticate(loginAuth.getEmail(), loginAuth.getPassword());
            if (user != null) {
                httpSession.setAttribute("loggedUser", user);
                return "redirect:/admin/dashboard";
            } else {
                return "login";
            }
        } else {
            return "login";
        }
    }
}
