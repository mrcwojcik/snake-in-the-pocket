package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrcwojcik.entity.Bank;
import pl.mrcwojcik.entity.Category;
import pl.mrcwojcik.entity.Goal;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.BankRepository;
import pl.mrcwojcik.repositories.BillRepository;
import pl.mrcwojcik.repositories.CategoryRepository;
import pl.mrcwojcik.repositories.UserRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/superAdmin")
public class SuperAdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    BankRepository bankRepository;

    @Autowired
    BillRepository billRepository;

    @GetMapping ("/")
    public String mainView(){
        return "superAdmin/main";
    }

    @GetMapping("/logout")
    public String logout(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("superAdmin");
        httpSession.setAttribute("superAdmin", null);
        return "redirect:/";
    }

    @GetMapping("/users")
    public String showUsers(){
        return "superAdmin/users";
    }

    @GetMapping("/delete/user/{id}")
    public String deleteUser(@PathVariable long id){
        userRepository.delete(userRepository.findById(id).get());
        return "redirect:/users";
    }

    @GetMapping("/edit/user/{id}")
    public String editUserView(@PathVariable long id, Model model){
        model.addAttribute("user", userRepository.findById(id).get());
        return "superAdmin/editUser";
    }

    @PostMapping("/edit/user/{id}")
    public String editUserPOST(@ModelAttribute User user){
        userRepository.save(user);
        return "redirect:/superAdmin/users";
    }

    @GetMapping("/details/user/{id}")
    public String userDetails(@PathVariable long id, Model model){
        model.addAttribute("user", userRepository.findById(id).get());
        return "superAdmin/userDetails";
    }

    @GetMapping("/userDetails/account/{id}")
    public String userAccountDetails(@PathVariable long id, Model model){
        model.addAttribute("bills", billRepository.findAllByAccount_Id(id));
        return "/superAdmin/userAccountDetails";
    }

    @GetMapping("/categories")
    public String showCategories(){
        return "superAdmin/categories";
    }

    @GetMapping("/delete/category/{id}")
    public String deleteCategory(@PathVariable long id){
        categoryRepository.delete(categoryRepository.findById(id).get());
        return "redirect:/superAdmin/categories";
    }

    @GetMapping("/edit/category/{id}")
    public String editCategoryView(@PathVariable long id, Model model){
        model.addAttribute("category", categoryRepository.findById(id).get());
        return "superAdmin/editCategory";
    }

    @PostMapping("/edit/category/{id}")
    public String editCategoryPOST(@ModelAttribute Category category){
        categoryRepository.save(category);
        return "redirect:/superAdmin/categories";
    }

    @GetMapping("/add/category")
    public String addCategory(Model model){
        model.addAttribute("category", new Category());
        return "superAdmin/editCategory";
    }

    @PostMapping("/add/category")
    public String addCategoryPOST(@ModelAttribute Category category){
        categoryRepository.save(category);
        return "redirect:/superAdmin/categories";
    }

    @GetMapping("/banks")
    public String showBanks(){
        return "superAdmin/banks";
    }

    @GetMapping("/add/bank")
    public String addBankView(Model model){
        model.addAttribute("bank", new Bank());
        return "superAdmin/addBank";
    }

    @PostMapping("/add/bank")
    public String addBankPost(@ModelAttribute Bank bank){
        bankRepository.save(bank);
        return "redirect:/superAdmin/banks";
    }

    @GetMapping("/edit/bank/{id}")
    public String editBankView(Model model, @PathVariable long id){
        model.addAttribute("bank", bankRepository.findById(id).get());
        return "superAdmin/addBank";
    }

    @GetMapping("/delete/bank/{id}")
    public String deleteBank(@PathVariable long id){
        bankRepository.delete(bankRepository.findById(id).get());
        return "redirect:/superAdmin/banks";
    }

    @ModelAttribute ("users")
    public List<User> getUsers(){
        return userRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> getCategories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("banks")
    public List<Bank> getBanks(){
        return bankRepository.findAll();
    }
}
