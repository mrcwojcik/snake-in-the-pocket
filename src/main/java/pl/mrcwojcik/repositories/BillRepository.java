package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Bill;

import java.util.List;

public interface BillRepository extends JpaRepository<Bill, Long> {

//    List<Bill> findAllByAccount_Id();

}
