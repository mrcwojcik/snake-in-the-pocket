package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Payer;

import java.util.List;

public interface PayerRepository extends JpaRepository<Payer, Long> {

    List<Payer> findAllByUserId(long id);

}
