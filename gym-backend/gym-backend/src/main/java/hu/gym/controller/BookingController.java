package hu.gym.controller;

import hu.gym.exception.NotFoundException;
import hu.gym.model.Booking;
import hu.gym.repository.BookingRepository;
import hu.gym.service.BookingService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
@CrossOrigin
public class BookingController {
    public record BookingRequest(@NotNull Long memberId, @NotNull Long classId) {}

    private final BookingService service;
    private final BookingRepository repo;

    public BookingController(BookingService service, BookingRepository repo) {
        this.service = service;
        this.repo = repo;
    }

    @GetMapping
    public List<Booking> all(@RequestParam(required = false) Long memberId) {
        return memberId == null ? repo.findAll() : repo.findByMemberId(memberId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Booking book(@Valid @RequestBody BookingRequest req) {
        return service.book(req.memberId(), req.classId());
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void cancel(@PathVariable Long id) {
        if (!repo.existsById(id)) throw new NotFoundException("Nincs ilyen foglalás: " + id);
        repo.deleteById(id);
    }
}
