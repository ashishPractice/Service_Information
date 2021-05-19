package com.infowave.informationsystem.repository;

import com.infowave.informationsystem.enitity.ServiceEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InfoRepository extends CrudRepository<ServiceEntity,Integer> {

    public List<ServiceEntity> findAllById(int providerId);

    @Query("SELECT t FROM ServiceEntity t WHERE t.provider.providerId=:pId AND t.month=:mon")
    public List<ServiceEntity> findMemberByProviderId(@Param("pId") String providerId,@Param("mon") String month);

    @Query("SELECT DISTINCT(t.member.memberName) FROM ServiceEntity t WHERE t.provider.providerId=:pId")
    public List<String> findMemberIdByProviderId(@Param("pId") String providerId);

}
