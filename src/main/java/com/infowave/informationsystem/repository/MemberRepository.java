package com.infowave.informationsystem.repository;

import com.infowave.informationsystem.enitity.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<MemberEntity, String> {

    public Optional<MemberEntity> findByMemberName(String memberName);
}
