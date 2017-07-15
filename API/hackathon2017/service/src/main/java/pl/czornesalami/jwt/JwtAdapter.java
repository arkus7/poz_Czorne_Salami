package pl.czornesalami.jwt;

import io.jsonwebtoken.*;

import javax.annotation.PostConstruct;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.enterprise.context.ApplicationScoped;
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

    public Jws<Claims> getClaim(String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException {
        return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
    }

}
