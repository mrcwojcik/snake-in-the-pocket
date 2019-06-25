package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Account;

import java.util.List;

public interface AccountRepository extends JpaRepository<Account, Long> {

    List<Account> findAllByUserId(Long id);

}
