package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.mrcwojcik.entity.Bill;

import java.util.List;

public interface BillRepository extends JpaRepository<Bill, Long> {

    List<Bill> findAllByAccount_Id(long id);
    List<Bill> findAllByPayerId(long id);

    @Query (value = "SELECT * FROM bills WHERE plusOrMinus = ?1", nativeQuery = true)
    List<Bill> findBillByPlusOrMinus(boolean answer);

    @Query (value = "SELECT * FROM bills WHERE created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findBillDate(int month);

    @Query (value = "SELECT * FROM bills WHERE payer_id = ?1 AND created >= date_add(NOW(), INTERVAL -?2 MONTH)", nativeQuery = true)
    List<Bill> findBillByDateAndPayer(long id, int month);

    @Query (value = "SELECT * FROM bills WHERE payer_id = ?1 AND plusOrMinus = true AND created >= date_add(NOW(), INTERVAL -?2 MONTH)", nativeQuery = true)
    List<Bill> findBillByDateAndPayerPLUS(long id, int month);

    @Query (value = "SELECT * FROM bills WHERE payer_id = ?1 AND plusOrMinus = false AND created >= date_add(NOW(), INTERVAL -?2 MONTH)", nativeQuery = true)
    List<Bill> findBillByDateAndPayerMINUS(long id, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id WHERE category_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndCategory(long id, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id WHERE plusOrMinus = true AND category_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndCategoryPLUS(long id, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id WHERE plusOrMinus = false AND category_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndCategoryMINUS(long id, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id WHERE category_id = ?1);", nativeQuery = true)
    List<Bill> findAllByCategory(long id);

    @Query (value = "SELECT * FROM bills WHERE account_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndAccount(long id, int month);

    @Query (value = "SELECT * FROM bills WHERE plusOrMinus = true AND account_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndAccountPLUS(long id, int month);

    @Query (value = "SELECT * FROM bills WHERE plusOrMinus = false AND account_id = ?1 AND created >= date_add(NOW(), INTERVAL -?1 MONTH);", nativeQuery = true)
    List<Bill> findAllByDateAndAccountMINUS(long id, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id " +
            "WHERE category_id = ?1 AND payer_id = ?2 AND account_id = ?3)", nativeQuery = true)
    List<Bill> findAllByMixCriteria(long categoryId, long payerId, long accountId);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id " +
            "WHERE category_id = ?1 AND payer_id = ?2 AND account_id = ?3 AND created >= date_add(NOW(), INTERVAL -?4 MONTH)", nativeQuery = true)
    List<Bill> findAllByMixByDateCriteria(long categoryId, long payerId, long accountId, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id " +
            "WHERE plusOrMinus = true AND category_id = ?1 AND payer_id = ?2 AND account_id = ?3 AND created >= date_add(NOW(), INTERVAL -?4 MONTH)", nativeQuery = true)
    List<Bill> findAllByMixCriteriaPLUS(long categoryId, long payerId, long accountId, int month);

    @Query (value = "SELECT * FROM bills INNER JOIN billDetails ON bills.id = billDetails.bill_id " +
            "WHERE plusOrMinus = false AND category_id = ?1 AND payer_id = ?2 AND account_id = ?3 AND created >= date_add(NOW(), INTERVAL -?4 MONTH)", nativeQuery = true)
    List<Bill> findAllByMixCriteriaMINUS(long categoryId, long payerId, long accountId, int month);

}
