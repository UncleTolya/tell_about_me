package ru.tolymhlv.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.tolymhlv.tam.domain.Message;
import ru.tolymhlv.tam.repos.MessageRepo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Clock;

@Service
public class MessageService {

    @Autowired
    private MessageRepo messageRepo;

    public String getDateDefaultFormat(Clock date) {
        DateFormat df = new SimpleDateFormat("dd.MM.yyyy");
        return df.format(date.millis());
    }

    public Iterable<Message> allMessageWithFilter(String filterMessageText) {
        Iterable<Message> messages;

        if (StringUtils.isEmpty(filterMessageText)) {
            messages = messageRepo.findAll();
        } else {
            messages = messageRepo.findByTextContaining(filterMessageText);
        }

        return messages;
    }
}
