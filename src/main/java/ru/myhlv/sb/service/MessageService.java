package ru.myhlv.sb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.myhlv.sb.domain.Message;
import ru.myhlv.sb.repos.MessageRepo;

@Service
public class MessageService {

    private final MessageRepo messageRepo;

    @Autowired
    public MessageService(MessageRepo messageRepo) {
        this.messageRepo = messageRepo;
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

    public Iterable<Message> allMessage() {
        return messageRepo.findAll();
    }

    public Iterable<Message> addMessage(Message message) {
        messageRepo.save(message);
        return messageRepo.findAll();
    }

    public boolean deleteMessage(Long id) {
        if (messageRepo.findById(id).isPresent()) {
            messageRepo.deleteById(id);
        }
        return !messageRepo.findById(id).isPresent();

    }

}
