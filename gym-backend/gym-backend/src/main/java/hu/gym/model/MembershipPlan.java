package hu.gym.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
public class MembershipPlan {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String name;
    @Positive
    private int monthlyPriceHuf;
    private String description;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getMonthlyPriceHuf() { return monthlyPriceHuf; }
    public void setMonthlyPriceHuf(int p) { this.monthlyPriceHuf = p; }
    public String getDescription() { return description; }
    public void setDescription(String d) { this.description = d; }
}
