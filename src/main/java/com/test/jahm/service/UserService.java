package com.test.jahm.service;

import com.test.jahm.entity.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
