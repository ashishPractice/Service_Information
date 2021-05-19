package com.infowave.informationsystem.enitity;


import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="service_tbl")
@Data
@ToString

public class ServiceEntity {

    @Id
    @GeneratedValue(
            strategy = GenerationType.AUTO,
            generator = "native"
    )
    @GenericGenerator(
            name="native",
            strategy = "native"
    )
    private int id;

    @Valid
    @NotNull
    @ManyToOne(cascade = CascadeType.ALL)
    private ProviderEntity provider;

    @Valid
    @NotNull
    @ManyToOne(cascade = CascadeType.ALL)
    private MemberEntity member;

    @Column(length = 5)
    private String month;

    @Column(length = 5)
    private String d1;

    @Column(length = 5)
    private String d2;

    @Column(length = 5)
    private String d3;

    @Column(length = 5)
    private String d4;

    @Column(length = 5)
    private String d5;

    @Column(length = 5)
    private String d6;

    @Column(length = 5)
    private String d7;

    @Column(length = 5)
    private String d8;

    @Column(length = 5)
    private String d9;

    @Column(length = 5)
    private String d10;

    @Column(length = 5)
    private String d11;

    @Column(length = 5)
    private String d12;

    @Column(length = 5)
    private String d13;

    @Column(length = 5)
    private String d14;

    @Column(length = 5)
    private String d15;

    @Column(length = 5)
    private String d16;

    @Column(length = 5)
    private String d17;

    @Column(length = 5)
    private String d18;

    @Column(length = 5)
    private String d19;

    @Column(length = 5)
    private String d20;

    @Column(length = 5)
    private String d21;

    @Column(length = 5)
    private String d22;

    @Column(length = 5)
    private String d23;

    @Column(length = 5)
    private String d24;

    @Column(length = 5)
    private String d25;

    @Column(length = 5)
    private String d26;

    @Column(length = 5)
    private String d27;

    @Column(length = 5)
    private String d28;

    @Column(length = 5)
    private String d29;

    @Column(length = 5)
    private String d30;

    @Column(length = 5)
    private String d31;

}
