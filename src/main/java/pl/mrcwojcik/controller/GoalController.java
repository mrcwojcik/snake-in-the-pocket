package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.mrcwojcik.additionals.GoalCalculate;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.entity.Goal;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.AccountRepository;
import pl.mrcwojcik.repositories.GoalRepository;
import pl.mrcwojcik.repositories.UserRepository;
import pl.mrcwojcik.service.GoalService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping ("/admin/goals")
public class GoalController {

    @Autowired
    private GoalRepository goalRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private GoalService goalService;

    @GetMapping("/")
    public String showAll(){
        return "goal/all";
    }

    @PostMapping("/")
    public String calculateForGoal(@ModelAttribute GoalCalculate goalCalculate, Model model){
        model.addAttribute("calculate", goalService.calculateGoal(goalCalculate));
        return "goal/all";
    }

    @GetMapping ("/add")
    public String addGoal(Model model){
        model.addAttribute("goal", new Goal());
        return "goal/add";
    }

    @PostMapping("/add")
    public String addGoalPOST(@ModelAttribute @Valid Goal goal, BindingResult result){
        if (result.hasErrors()){
            return "goal/add";
        }

        goalRepository.save(goal);
        return "redirect:/admin/goals/";
    }

    @GetMapping("/edit/{id}")
    public String editGoal(@PathVariable long id, Model model){
        model.addAttribute("goal", goalRepository.findById(id).get());
        return "goal/add";
    }

    @PostMapping("/edit/{id}")
    public String editGoalPOST(@ModelAttribute @Valid Goal goal, BindingResult result){
        if (result.hasErrors()){
            return "goal/add";
        }

        goalRepository.save(goal);
        return "redirect:/admin/goals/";
    }

    @GetMapping("/delete/{id}")
    public String deleteGoal(@PathVariable long id){
        goalRepository.delete(goalRepository.findById(id).get());
        return "redirect:/admin/goals/";
    }

    @ModelAttribute("goals")
    public List<Goal> getGoals(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return goalRepository.findAllByUserId(user.getId());
    }

    @ModelAttribute("accounts")
    public List<Account> getAccounts(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("loggedUser");
        return accountRepository.findAllByUserId(user.getId());
    }

    @ModelAttribute("goalCalculate")
    public GoalCalculate getObjectToCalculate(){
        return new GoalCalculate();
    }

    @ModelAttribute("user")
    public User getFromSession(HttpSession httpSession){
        return (User) httpSession.getAttribute("loggedUser");
    }

}
