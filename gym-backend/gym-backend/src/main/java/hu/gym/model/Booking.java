package hu.gym.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"member_id", "gym_class_id"}))
public class Booking {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Member member;
    @ManyToOne(optional = false)
    private GymClass gymClass;
    private LocalDateTime createdAt = LocalDateTime.now();

    public Long getId() { return id; }
    public Member getMember() { return member; }
    public void setMember(Member member) { this.member = member; }
    public GymClass getGymClass() { return gymClass; }
    public void setGymClass(GymClass gymClass) { this.gymClass = gymClass; }
    public LocalDateTime getCreatedAt() { return createdAt; }
}
