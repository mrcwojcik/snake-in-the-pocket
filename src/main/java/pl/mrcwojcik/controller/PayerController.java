package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Payer;
import pl.mrcwojcik.repositories.PayerRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/admin/payer")
public class PayerController {

    @Autowired
    PayerRepository payerRepository;

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

    @ModelAttribute ("payers")
    public List<Payer> getAllPayers(){
        return payerRepository.findAll();
    }

}
