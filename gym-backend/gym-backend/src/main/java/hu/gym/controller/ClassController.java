package hu.gym.controller;

import hu.gym.exception.NotFoundException;
import hu.gym.model.GymClass;
import hu.gym.repository.BookingRepository;
import hu.gym.repository.GymClassRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/classes")
@CrossOrigin
public class ClassController {
    private final GymClassRepository repo;
    private final BookingRepository bookings;

    public ClassController(GymClassRepository repo, BookingRepository bookings) {
        this.repo = repo;
        this.bookings = bookings;
    }

    @GetMapping
    public List<GymClass> all() { return repo.findAll(); }

    @GetMapping("/{id}")
    public GymClass one(@PathVariable Long id) {
        return repo.findById(id).orElseThrow(() -> new NotFoundException("Nincs ilyen óra: " + id));
    }

    @GetMapping("/{id}/availability")
    public Map<String, Object> availability(@PathVariable Long id) {
        GymClass c = one(id);
        long taken = bookings.countByGymClassId(id);
        return Map.of("capacity", c.getCapacity(), "booked", taken, "free", Math.max(0, c.getCapacity() - taken));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public GymClass create(@Valid @RequestBody GymClass c) {
        c.setId(null);
        return repo.save(c);
    }

    @PutMapping("/{id}")
    public GymClass update(@PathVariable Long id, @Valid @RequestBody GymClass c) {
        one(id);
        c.setId(id);
        return repo.save(c);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) { one(id); repo.deleteById(id); }
}
