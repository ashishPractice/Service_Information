package com.infowave.informationsystem.repository;

import com.infowave.informationsystem.enitity.LoginEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LoginRepository extends JpaRepository<LoginEntity, Integer> {

    public Optional<LoginEntity> findByUsernameAndPassword(String username, String password);


}
