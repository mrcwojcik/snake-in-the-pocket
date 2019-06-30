package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Bank;
import pl.mrcwojcik.repositories.BankRepository;

import javax.validation.Valid;

@Controller
@RequestMapping ("/admin/bank")
public class BankController {

    @Autowired
    private BankRepository bankRepository;

    @GetMapping ("/add")
    public String addBank(Model model){
        model.addAttribute("bank", new Bank());
        return "bank/add";
    }

    @PostMapping("/add")
    public String addBankPOST(@ModelAttribute @Valid Bank bank, BindingResult result){
        if (result.hasErrors()){
            return "bank/add";
        }

        bankRepository.save(bank);
        return "redirect:/admin/dashboard";
    }

}
