package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.BillDetails;

import java.util.List;

public interface BillDetailsRepository extends JpaRepository<BillDetails, Long> {

    List<BillDetails> findByBillId(long id);
    BillDetails findByCategoryIdAndBill_Id(long categoryId, long billId);

}
