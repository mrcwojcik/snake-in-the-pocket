package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Payer;
import pl.mrcwojcik.repositories.PayerRepository;

public class PayerConverter implements Converter<String, Payer> {

    @Autowired
    private PayerRepository payerRepository;

    @Override
    public Payer convert(String s) {
        return payerRepository.findById(Long.parseLong(s)).get();
    }
}
