package hu.gym.controller;

import hu.gym.exception.NotFoundException;
import hu.gym.model.MembershipPlan;
import hu.gym.repository.MembershipPlanRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/plans")
@CrossOrigin
public class PlanController {
    private final MembershipPlanRepository repo;

    public PlanController(MembershipPlanRepository repo) { this.repo = repo; }

    @GetMapping
    public List<MembershipPlan> all() { return repo.findAll(); }

    @GetMapping("/{id}")
    public MembershipPlan one(@PathVariable Long id) {
        return repo.findById(id).orElseThrow(() -> new NotFoundException("Nincs ilyen bérlet: " + id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public MembershipPlan create(@Valid @RequestBody MembershipPlan p) {
        p.setId(null);
        return repo.save(p);
    }

    @PutMapping("/{id}")
    public MembershipPlan update(@PathVariable Long id, @Valid @RequestBody MembershipPlan p) {
        one(id);
        p.setId(id);
        return repo.save(p);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) { one(id); repo.deleteById(id); }
}
