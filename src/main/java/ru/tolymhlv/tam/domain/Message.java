package ru.tolymhlv.tam.domain;

import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.time.Clock;
import java.util.Date;

@Entity
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String text;

    private Date date;


    public Message() {
    }


    public Message(String text) {
        this.text = text;
        this.date = new Date();

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
