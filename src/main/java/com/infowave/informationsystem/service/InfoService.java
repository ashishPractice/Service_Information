package com.infowave.informationsystem.service;

import com.infowave.informationsystem.model.LoginModel;
import com.infowave.informationsystem.model.MemberModel;
import com.infowave.informationsystem.model.ProviderModel;
import com.infowave.informationsystem.model.ServiceModel;

import java.util.List;

public interface InfoService {

    public LoginModel authentication(String username, String password);

    public List<ServiceModel> findAllMember(String providerId, String month);

    public ServiceModel getInfoById(int id);

    public String updateInfo(ServiceModel serviceModel);

    public String addMember(MemberModel member);

    public List<String> getMemberList(String providerId);

    public String addNewRecord(String month, List<String> memList, String providerId);
}
