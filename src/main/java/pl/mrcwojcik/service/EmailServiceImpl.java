package pl.mrcwojcik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailServiceImpl {

    @Autowired
    public JavaMailSender emailSender;

    public void sendSimpleMessage(String to, String from, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        message.setReplyTo(from);
        message.setFrom(from);

        emailSender.send(message);
    }

    public SimpleMailMessage templateSimpleMessage(String message) {
        SimpleMailMessage txt = new SimpleMailMessage();
        txt.setText(message);
        return txt;
    }
}