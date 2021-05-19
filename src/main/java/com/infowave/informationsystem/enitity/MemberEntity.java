package com.infowave.informationsystem.enitity;

import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Set;

@Entity
@Table(name="member_tbl")
@Data
@ToString
public class MemberEntity {

    @Id
    private String memberId;

    @Valid
    @NotNull
    private String memberName;




}
