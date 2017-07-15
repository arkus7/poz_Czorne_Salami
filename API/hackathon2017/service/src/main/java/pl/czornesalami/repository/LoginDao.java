package pl.czornesalami.repository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@ApplicationScoped
public class LoginDao {

    @Inject
    private Repo repo;

    public boolean login(String username, String password) {
        Optional<String> actualPassword = repo.getLoginPassword(username);
        if(actualPassword.isPresent()) {
            return actualPassword.get().equals(password);
        }
        repo.addLogin(username, password);
        return true;
    }

    public boolean usernameExists(String username) {
        Optional<String> actualPassword = repo.getLoginPassword(username);
        return actualPassword.isPresent();
    }

}
