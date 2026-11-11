package hu.gym.controller;

import hu.gym.exception.NotFoundException;
import hu.gym.model.Member;
import hu.gym.model.MembershipPlan;
import hu.gym.repository.MemberRepository;
import hu.gym.repository.MembershipPlanRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/members")
@CrossOrigin
public class MemberController {
    private final MemberRepository repo;
    private final MembershipPlanRepository plans;

    public MemberController(MemberRepository repo, MembershipPlanRepository plans) {
        this.repo = repo;
        this.plans = plans;
    }

    @GetMapping
    public List<Member> all() { return repo.findAll(); }

    @GetMapping("/{id}")
    public Member one(@PathVariable Long id) {
        return repo.findById(id).orElseThrow(() -> new NotFoundException("Nincs ilyen tag: " + id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Member create(@Valid @RequestBody Member m) {
        m.setId(null);
        m.setPlan(resolvePlan(m.getPlan()));
        return repo.save(m);
    }

    @PutMapping("/{id}")
    public Member update(@PathVariable Long id, @Valid @RequestBody Member m) {
        Member old = one(id);
        m.setId(id);
        m.setJoinedAt(old.getJoinedAt());
        m.setPlan(resolvePlan(m.getPlan()));
        return repo.save(m);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) { one(id); repo.deleteById(id); }

    private MembershipPlan resolvePlan(MembershipPlan p) {
        if (p == null || p.getId() == null) return null;
        return plans.findById(p.getId())
                .orElseThrow(() -> new NotFoundException("Nincs ilyen bérlet: " + p.getId()));
    }
}
