package hu.gym.service;

import hu.gym.exception.ConflictException;
import hu.gym.exception.NotFoundException;
import hu.gym.model.Booking;
import hu.gym.model.GymClass;
import hu.gym.model.Member;
import hu.gym.repository.BookingRepository;
import hu.gym.repository.GymClassRepository;
import hu.gym.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
public class BookingService {
    private final BookingRepository bookings;
    private final MemberRepository members;
    private final GymClassRepository classes;

    public BookingService(BookingRepository bookings, MemberRepository members, GymClassRepository classes) {
        this.bookings = bookings;
        this.members = members;
        this.classes = classes;
    }

    @Transactional
    public Booking book(Long memberId, Long classId) {
        Member member = members.findById(memberId)
                .orElseThrow(() -> new NotFoundException("Nincs ilyen tag: " + memberId));
        GymClass gymClass = classes.findById(classId)
                .orElseThrow(() -> new NotFoundException("Nincs ilyen óra: " + classId));

        if (gymClass.getStartTime().isBefore(LocalDateTime.now()))
            throw new ConflictException("Ez az óra már elkezdődött.");
        if (bookings.existsByMemberIdAndGymClassId(memberId, classId))
            throw new ConflictException("Erre az órára már jelentkeztél.");
        if (bookings.countByGymClassId(classId) >= gymClass.getCapacity())
            throw new ConflictException("Az óra betelt.");

        Booking b = new Booking();
        b.setMember(member);
        b.setGymClass(gymClass);
        return bookings.save(b);
    }
}
