package com.test.jahm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jahm.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
