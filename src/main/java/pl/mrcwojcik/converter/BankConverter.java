package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Bank;
import pl.mrcwojcik.repositories.BankRepository;

public class BankConverter implements Converter<String, Bank> {

    @Autowired
    BankRepository bankRepository;

    @Override
    public Bank convert(String s) {
        return bankRepository.findById(Long.parseLong(s)).get();
    }
}
