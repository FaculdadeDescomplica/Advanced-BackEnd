package br.com.lgpd.service;

import br.com.lgpd.entity.User;
import org.springframework.data.crossstore.ChangeSetPersister;

import java.util.List;

public interface UserService {
    User createUser(User user);

    User getUserById(Long userId) throws ChangeSetPersister.NotFoundException;

    List<User> getAllUsers();

    User updateUser(User user);

    void deleteUser(Long userId);
}
