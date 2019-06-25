package pl.mrcwojcik.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mrcwojcik.entity.User;
import pl.mrcwojcik.repositories.UserRepository;

@Service
public class AuthenticationService {

    @Autowired
    UserRepository userRepository;

    public boolean givenEmailExistInDb(String email){
        User user = userRepository.findByEmail(email);
        if (user != null){
            return true;
        }

        return false;
    }

    public User authenticate(String email, String password){
        User user = userRepository.findByEmail(email);
        boolean equalPassword = BCrypt.checkpw(password, user.getPassword());

        if (equalPassword){
            return user;
        }

        return null;
    }


}
