package pl.mrcwojcik.additionals;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

public class LoginAuth {

    @NotEmpty
    @Email (message = "Podaj właściwy adres e-mail")
    private String email;

    @NotEmpty (message = "Hasło nie może być puste")
    private String password;

    public LoginAuth() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
