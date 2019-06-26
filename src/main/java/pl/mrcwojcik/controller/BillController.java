package pl.mrcwojcik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.repositories.BillDetailsRepository;
import pl.mrcwojcik.repositories.BillRepository;

import java.util.List;

@Controller
@RequestMapping ("/admin/transaction")
public class BillController {

    @Autowired
    BillRepository billRepository;

    @Autowired
    BillDetailsRepository billDetailsRepository;

//
//    @ModelAttribute("bills")
//    public List<Bill> getBillsByUser(){
//        return billRepository
//    }



}
