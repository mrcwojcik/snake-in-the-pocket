package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.Goal;

public interface GoalRepository extends JpaRepository<Goal, Long> {
}
