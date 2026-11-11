package hu.gym;

import hu.gym.model.GymClass;
import hu.gym.model.MembershipPlan;
import hu.gym.repository.GymClassRepository;
import hu.gym.repository.MembershipPlanRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;

@Configuration
public class DataLoader {

    @Bean
    CommandLineRunner seed(MembershipPlanRepository plans, GymClassRepository classes) {
        return args -> {
            if (plans.count() == 0) {
                plans.save(plan("Havi bérlet", 14900, "Korlátlan belépés, 1 hónap"));
                plans.save(plan("10 alkalmas", 12900, "10 belépés, 3 hónapig érvényes"));
                plans.save(plan("Diák bérlet", 9900, "Diákigazolvánnyal, 1 hónap"));
            }
            if (classes.count() == 0) {
                classes.save(gymClass("Reggeli jóga", "Kovács Anna", 1, 8, 12));
                classes.save(gymClass("Crossfit", "Nagy Péter", 1, 18, 10));
                classes.save(gymClass("Spinning", "Tóth Eszter", 2, 17, 15));
            }
        };
    }

    private MembershipPlan plan(String name, int price, String desc) {
        MembershipPlan p = new MembershipPlan();
        p.setName(name);
        p.setMonthlyPriceHuf(price);
        p.setDescription(desc);
        return p;
    }

    private GymClass gymClass(String title, String trainer, int daysAhead, int hour, int cap) {
        GymClass c = new GymClass();
        c.setTitle(title);
        c.setTrainer(trainer);
        c.setStartTime(LocalDateTime.now().plusDays(daysAhead).withHour(hour).withMinute(0).withSecond(0).withNano(0));
        c.setCapacity(cap);
        return c;
    }
}
