package ru.myhlv.sb.repos;

import org.springframework.data.repository.CrudRepository;
import ru.myhlv.sb.domain.Message;

public interface MessageRepo extends CrudRepository<Message, Long> {
    Iterable<Message> findByTextContaining(String filterMessageText);
}
