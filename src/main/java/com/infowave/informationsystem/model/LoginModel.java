package com.infowave.informationsystem.model;

import com.infowave.informationsystem.enitity.ProviderEntity;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class LoginModel {

    private int id;
    private String username;
    private String password;
    private ProviderEntity provider;
}
