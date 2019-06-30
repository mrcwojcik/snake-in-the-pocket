package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Payer;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.PayerRepository;
import pl.mrcwojcik.repositories.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/admin/payer")
public class PayerController {

    @Autowired
    private PayerRepository payerRepository;

    @GetMapping ("/")
    public String showAllPayers(){
        return "payer/all";
    }

    @GetMapping("/add")
    public String addPayerView(Model model){
        model.addAttribute("payer", new Payer());
        return "payer/add";
    }

    @PostMapping("/add")
    public String addPayerPOST(@ModelAttribute @Valid Payer payer, BindingResult result){
        if (result.hasErrors()){
            return "payer/add";
        }

        payerRepository.save(payer);
        return "redirect:/admin/payer/";
    }

    @GetMapping("/edit/{id}")
    public String editPayerView(Model model, @PathVariable long id){
        model.addAttribute("payer", payerRepository.findById(id).get());
        return "payer/edit";
    }

    @PostMapping("/edit/{id}")
    public String editPayerPOST(@ModelAttribute @Valid Payer payer, BindingResult result){
        if (result.hasErrors()){
            return "payer/edit";
        }

        payerRepository.save(payer);
        return "redirect:/admin/payer/";
    }

    @ModelAttribute ("payers")
    public List<Payer> getAllPayers(){
        return payerRepository.findAll();
    }

    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

}
