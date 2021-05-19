package com.infowave.informationsystem.enitity;


import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="login_tbl")
@Data
@ToString

public class LoginEntity {

    @javax.persistence.Id
    @GeneratedValue(
            strategy = GenerationType.AUTO,
            generator = "native"
    )
    @GenericGenerator(
            name="native",
            strategy = "native"
    )
    private int Id;

    @Valid
    @NotNull
    private String username;

    @Valid
    @NotNull
    private String password;

    @OneToOne(cascade = CascadeType.ALL, optional = false)
    private ProviderEntity provider;
}
