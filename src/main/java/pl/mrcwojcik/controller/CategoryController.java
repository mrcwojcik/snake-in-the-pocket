package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Category;
import pl.mrcwojcik.repositories.CategoryRepository;

import java.util.List;

@Controller
@RequestMapping ("/admin/category")
public class CategoryController {

    @Autowired
    CategoryRepository categoryRepository;

    @GetMapping ("/")
    public String showCategories(){
        return "category/all";
    }

    @ModelAttribute ("categories")
    public List<Category> getAllCategories(){
        return categoryRepository.findAll();
    }

}
