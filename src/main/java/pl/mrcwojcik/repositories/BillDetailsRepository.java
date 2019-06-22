package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.BillDetails;

public interface BillDetailsRepository extends JpaRepository<BillDetails, Long> {
}
