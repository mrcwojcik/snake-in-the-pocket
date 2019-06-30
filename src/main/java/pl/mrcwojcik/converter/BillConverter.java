package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Bill;
import pl.mrcwojcik.repositories.BillRepository;

public class BillConverter implements Converter<String, Bill> {

    @Autowired
    private BillRepository billRepository;

    @Override
    public Bill convert(String s) {
        return billRepository.findById(Long.parseLong(s)).get();
    }
}
