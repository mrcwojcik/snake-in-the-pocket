package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.mrcwojcik.entity.Bank;

@Repository
public interface BankRepository extends JpaRepository<Bank, Long> {
}
