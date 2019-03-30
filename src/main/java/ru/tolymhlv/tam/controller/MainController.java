package ru.tolymhlv.tam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.tolymhlv.tam.domain.Message;
import ru.tolymhlv.tam.service.FileService;
import ru.tolymhlv.tam.service.MessageService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Controller
public class MainController {
    private final MessageService messageService;
    private final FileService fileService;

    @Autowired
    public MainController(MessageService messageService, FileService fileService) {
        this.messageService = messageService;
        this.fileService = fileService;
    }



    @GetMapping("/")
    public String showcase(Model model) {
        model.addAttribute("messages", messageService.allMessage());
        return "main";
    }


    @GetMapping("/main")
    public String filter(@RequestParam(required = false) String filterMessageText, Model model) {
        model.addAttribute("messages", messageService.allMessageWithFilter(filterMessageText));
        model.addAttribute("filterMessageText", filterMessageText);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @RequestParam(name = "messageText", required = false, defaultValue = "Default message text") String messageText,
            @RequestParam("messagePicture") MultipartFile multipartFile,
            Model model) {
        Message message = new Message(messageText);
        if (fileService.fileNameIsValid(multipartFile)) {
            String tempFileName = fileService.getTempFileName(multipartFile);
            message.setFilePicture(tempFileName);
        }
        model.addAttribute("messages", messageService.addMessage(message));
        return "main";
    }
}
