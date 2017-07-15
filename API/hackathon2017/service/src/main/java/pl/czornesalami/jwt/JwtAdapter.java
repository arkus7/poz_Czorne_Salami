package pl.czornesalami.jwt;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.annotation.PostConstruct;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.security.NoSuchAlgorithmException;

@ApplicationScoped
public class JwtAdapter {

    private SecretKey secretKey;

    @PostConstruct
    public void init() {
        KeyGenerator keyGenerator = null;
        try {
            keyGenerator = KeyGenerator.getInstance("AES");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        secretKey = keyGenerator.generateKey();
    }

    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
    }

    public boolean validToken(String token) {
        try {
            // Validate the token
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
            //logger.info("#### valid token : " + token);
            return true;
        } catch (Exception e) {
            //logger.severe("#### invalid token : " + token);
            return false;
        }
    }

}
