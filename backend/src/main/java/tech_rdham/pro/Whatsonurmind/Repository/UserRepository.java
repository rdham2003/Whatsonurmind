package tech_rdham.pro.Whatsonurmind.Repository;
import tech_rdham.pro.Whatsonurmind.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}

