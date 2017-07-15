package pl.czornesalami.repository;

import pl.czornesalami.rest.model.ProfileDto;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.Optional;

@ApplicationScoped
public class ProfileDao {

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

    public void addOrUpdateProfile(String username, ProfileDto profile) {
        repo.addOrUpdateProfile(username, profile);
    }

    public Optional<ProfileDto> getProfile(String username) {
        return repo.getProfile(username);
    }

}
