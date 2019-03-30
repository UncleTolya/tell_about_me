package ru.tolymhlv.tam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.tolymhlv.tam.domain.Message;
import ru.tolymhlv.tam.repos.MessageRepo;
import ru.tolymhlv.tam.service.MessageService;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private MessageService messageService;

    @GetMapping
    public String showcase(Model model) {
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);
        return "main";
    }

    @PostMapping
    public String add(
            @RequestParam(name = "messageText", required = false, defaultValue = "Default message text") String messageText,
            Model model) {

        Message message = new Message(messageText);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        return "main";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filterMessageText, Model model) {
        model.addAttribute("messages", messageService.allMessageWithFilter(filterMessageText));
        model.addAttribute("filterMessageText", filterMessageText);
        return "main";
    }
}
