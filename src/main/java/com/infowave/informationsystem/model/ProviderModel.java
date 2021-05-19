package com.infowave.informationsystem.model;

import com.infowave.informationsystem.enitity.LoginEntity;
import lombok.Data;
import lombok.ToString;

import javax.persistence.CascadeType;
import javax.persistence.OneToOne;

@Data
@ToString
public class ProviderModel {

    private String providerId;
    private String providerName;
}
