package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Payer;

public interface PayerRepository extends JpaRepository<Payer, Long> {
}
