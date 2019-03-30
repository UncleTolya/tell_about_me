package ru.tolymhlv.tam.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileService {

    @Value("${upload.path}")
    private String uploadPath;

    public boolean fileNameIsValid(MultipartFile multipartFile) {
        return multipartFile != null && !multipartFile.getOriginalFilename().isEmpty();
    }

    public String getTempFileName(MultipartFile multipartFile) {
        String tempFileName = null;
        try {
            Path uploadDir = Paths.get(uploadPath);
            if (!Files.exists(uploadDir)) {
                Files.createDirectory(uploadDir);
            }
            String uuidFile = UUID.randomUUID().toString();
            tempFileName = uuidFile + multipartFile.getOriginalFilename();

            multipartFile.transferTo(Paths.get(uploadDir + "/" + tempFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return tempFileName;
    }
}
