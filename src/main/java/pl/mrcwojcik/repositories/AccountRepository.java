package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {
}
