package ru.tolymhlv.tam.repos;

import org.springframework.data.repository.CrudRepository;
import ru.tolymhlv.tam.domain.Message;

public interface MessageRepo extends CrudRepository<Message, Long> {
    Iterable<Message> findByTextContaining(String filterMessageText);
}
