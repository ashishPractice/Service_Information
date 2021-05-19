package com.infowave.informationsystem.service;

import com.infowave.informationsystem.enitity.LoginEntity;
import com.infowave.informationsystem.enitity.MemberEntity;
import com.infowave.informationsystem.enitity.ProviderEntity;
import com.infowave.informationsystem.enitity.ServiceEntity;
import com.infowave.informationsystem.model.LoginModel;
import com.infowave.informationsystem.model.MemberModel;
import com.infowave.informationsystem.model.ServiceModel;
import com.infowave.informationsystem.repository.InfoRepository;
import com.infowave.informationsystem.repository.LoginRepository;
import com.infowave.informationsystem.repository.MemberRepository;
import com.infowave.informationsystem.repository.ProviderRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class InfoServiceImpl implements InfoService {

    @Autowired
    private LoginRepository loginRepository;

    @Autowired
    private InfoRepository infoRepository;

    @Autowired
    private ProviderRepository providerRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public LoginModel authentication(String username, String password) {
        LoginModel login = null;

        Optional<LoginEntity> loginEntity = loginRepository.findByUsernameAndPassword(username, password);
        if (loginEntity.isPresent()) {
            login = new LoginModel();
            BeanUtils.copyProperties(loginEntity.get(), login);
        }
        System.out.println(login);
        return login;
    }

    @Override
    public List<ServiceModel> findAllMember(String providerId, String month) {
        List<ServiceModel> servicelist = new ArrayList<ServiceModel>();

     //  List<ServiceEntity> serviceEntity = (List<ServiceEntity>) infoRepository.findAllById(Integer.parseInt(providerId));

        List<ServiceEntity> serviceEntity = (List<ServiceEntity>) infoRepository.findMemberByProviderId(providerId, month);
        for (ServiceEntity ser : serviceEntity) {
            ServiceModel serviceModel = new ServiceModel();
            BeanUtils.copyProperties(ser, serviceModel);
            servicelist.add(serviceModel);
        }

        return servicelist;

    }

    @Override
    public ServiceModel getInfoById(int id) {

        ServiceModel serviceModel = null;

        Optional<ServiceEntity> serviceEntity = infoRepository.findById(id);

        if(serviceEntity.isPresent()) {
            serviceModel =  new ServiceModel();
            BeanUtils.copyProperties(serviceEntity.get(), serviceModel);
        }
        return serviceModel;
    }

    @Override
    public String updateInfo(ServiceModel serviceModel) {

        ProviderEntity provider = providerRepository.findById(serviceModel.getProviderId()).get();
        MemberEntity member = memberRepository.findById(serviceModel.getMemberId()).get();


        ServiceEntity serviceEntity = new ServiceEntity();
        BeanUtils.copyProperties(serviceModel, serviceEntity);

        serviceEntity.setProvider(provider);
        serviceEntity.setMember(member);


        infoRepository.save(serviceEntity);
        return "Record Updated";
    }

    @Override
    public String addMember(MemberModel member) {

        ProviderEntity provider= providerRepository.findById(member.getProviderId()).get();

        MemberEntity memberEntity = new MemberEntity();
        BeanUtils.copyProperties(member, memberEntity);

        System.out.println(memberEntity);

        memberRepository.save(memberEntity);

        MemberEntity memberEn = memberRepository.findById(member.getMemberId()).get();
        ServiceEntity serviceEntity = new ServiceEntity();
        serviceEntity.setProvider(provider);
        serviceEntity.setMember(memberEn);

        SimpleDateFormat simpleformat = new SimpleDateFormat("E, dd MMM yyyy");
        simpleformat = new SimpleDateFormat("MMM");
        serviceEntity.setMonth(simpleformat.format(new Date()));

        System.out.println(serviceEntity);

        infoRepository.save(serviceEntity);

        return "Member Added Successfully";

    }

    @Override
    public List<String> getMemberList(String providerId) {
        List<String> memberList = infoRepository.findMemberIdByProviderId(providerId);
        return memberList;
    }

    @Override
    public String addNewRecord(String month, List<String> memList, String providerId) {

        ProviderEntity provider= providerRepository.findById(providerId).get();

        for(String m: memList){
            MemberEntity memberEntity = memberRepository.findByMemberName(m).get();
            ServiceEntity serviceEntity = new ServiceEntity();
            serviceEntity.setProvider(provider);
            serviceEntity.setMember(memberEntity);
            serviceEntity.setMonth(month);

            infoRepository.save(serviceEntity);
        }

        return "Successfully Insert Record";
    }


}
