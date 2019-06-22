package pl.mrcwojcik.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.mrcwojcik.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
