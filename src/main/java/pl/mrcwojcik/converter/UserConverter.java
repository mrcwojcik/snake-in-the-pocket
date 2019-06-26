package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.UserRepository;

public class UserConverter implements Converter<String, User> {

    @Autowired
    UserRepository userRepository;

    @Override
    public User convert(String s) {
        return userRepository.findById(Long.parseLong(s)).get();
    }
}
