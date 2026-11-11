# Gym backend (Spring Boot 3, Java 21)

## IntelliJ-ben megnyitás
1. File > Open > válaszd ki a `gym-backend` mappát (a `pom.xml`-t), "Open as Project".
2. File > Project Structure > Project > SDK: **21** (ha nincs: Add SDK > Download JDK > 21).
3. Settings > Build, Execution, Deployment > Compiler > Java Compiler > Project bytecode version: 21.
4. Futtasd a `GymApplication` osztályt (zöld nyíl). Cím: http://localhost:8080

## Végpontok
- GET/POST  /api/plans     GET/PUT/DELETE /api/plans/{id}
- GET/POST  /api/members   GET/PUT/DELETE /api/members/{id}
- GET/POST  /api/classes   GET/PUT/DELETE /api/classes/{id}
- GET       /api/classes/{id}/availability
- GET/POST  /api/bookings  DELETE /api/bookings/{id}  (GET ?memberId=1)

H2 konzol: http://localhost:8080/h2-console
(JDBC URL: jdbc:h2:file:./data/gymdb, user: sa, jelszó üres)

## Példák
curl -X POST localhost:8080/api/members -H "Content-Type: application/json" \
  -d '{"name":"Kiss Béla","email":"bela@example.com","phone":"+36301234567","plan":{"id":1}}'

curl -X POST localhost:8080/api/bookings -H "Content-Type: application/json" \
  -d '{"memberId":1,"classId":1}'
