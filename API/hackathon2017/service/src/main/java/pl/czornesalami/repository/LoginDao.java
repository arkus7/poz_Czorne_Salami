package pl.czornesalami.repository;

import javax.enterprise.context.ApplicationScoped;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ApplicationScoped
public class LoginDao {

    private Map<String, String> testRepo = new ConcurrentHashMap<String, String>();

    public boolean login(String username, String password) {
        if(testRepo.containsKey(username)) {
            return testRepo.get(username).equals(password);
        }
        testRepo.put(username, password);
        return true;
    }


}
