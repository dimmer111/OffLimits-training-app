package hu.gym.repository;

import hu.gym.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    long countByGymClassId(Long classId);
    boolean existsByMemberIdAndGymClassId(Long memberId, Long classId);
    List<Booking> findByMemberId(Long memberId);
}
