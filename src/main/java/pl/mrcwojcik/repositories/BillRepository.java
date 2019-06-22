package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Bill;

public interface BillRepository extends JpaRepository<Bill, Long> {
}
