package hu.gym.repository;

import hu.gym.model.GymClass;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GymClassRepository extends JpaRepository<GymClass, Long> {
}
