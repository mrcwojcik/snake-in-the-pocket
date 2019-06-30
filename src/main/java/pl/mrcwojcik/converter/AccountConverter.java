package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.repositories.AccountRepository;

public class AccountConverter implements Converter<String, Account> {

    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Account convert(String s) {
        return accountRepository.findById(Long.parseLong(s)).get();
    }
}
