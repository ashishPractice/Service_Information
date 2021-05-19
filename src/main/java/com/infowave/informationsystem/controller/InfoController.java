package com.infowave.informationsystem.controller;

import com.infowave.informationsystem.model.Counter;
import com.infowave.informationsystem.model.LoginModel;
import com.infowave.informationsystem.model.MemberModel;
import com.infowave.informationsystem.model.ServiceModel;
import com.infowave.informationsystem.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
public class InfoController {

    @Autowired
    private InfoService infoService;

    @GetMapping(value = {"/","login"})
    public String testing() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        if (session != null) {
            session.invalidate();
        }
        return "login";
    }

    @PostMapping("/authentication")
    public String authenticate(@RequestParam String username, @RequestParam String password, Model model,
                               HttpSession session) {

        System.out.println("Inisde");
        LoginModel login = infoService.authentication(username, password);
        if (login != null) {
            session.setAttribute("infoSession", login);
            return "redirect:dashboard";
        }
        model.addAttribute("message", "Invalid username and password");
        return "login";
    }


    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        LoginModel login = (LoginModel) session.getAttribute("infoSession");
        String strMonth = (String)model.asMap().get("month");
        String message = (String)model.asMap().get("message");

        if(login != null) {

            if(strMonth != null){

            }else {
                SimpleDateFormat simpleformat = new SimpleDateFormat("E, dd MMM yyyy");
                simpleformat = new SimpleDateFormat("MMM");
                strMonth = simpleformat.format(new Date());
            }
            List<ServiceModel> memberList = infoService.findAllMember(login.getProvider().getProviderId(), strMonth);

            model.addAttribute("memberList", memberList);
            model.addAttribute("month",strMonth);
            model.addAttribute("counter", new Counter());

            return "dashboard";
        }else{
            return "login";
        }
    }

    @PostMapping("/dashboard")
    public String dashboard(@RequestParam String month, HttpSession session, Model model) {
        LoginModel login = (LoginModel) session.getAttribute("infoSession");

        if(login != null) {
            List<ServiceModel> memberList = infoService.findAllMember(login.getProvider().getProviderId(), month);

            model.addAttribute("memberList", memberList);
            model.addAttribute("month",month);

            return "dashboard";
        }else{
            return "login";
        }
    }


    @GetMapping("/getInfo")
    public String getInfo(@RequestParam int Id, HttpSession session, Model model){

        if(session.getAttribute("infoSession") != null){
            ServiceModel member = infoService.getInfoById(Id);
            model.addAttribute("member",member);
            return "updateInfo";
        }else{
            return "login";
        }
    }


    @PostMapping("/updateInfo")
    public String updateInfo(@ModelAttribute ServiceModel service, HttpSession session, RedirectAttributes redirectAttributes){

        if(session.getAttribute("infoSession") != null){

            String message = infoService.updateInfo(service);
            redirectAttributes.addFlashAttribute("message", message);
            redirectAttributes.addFlashAttribute("month", service.getMonth());
            return "redirect:dashboard";
        }else{
            return "login";
        }

    }

    @GetMapping("/addMember")
    public String addMember(HttpSession session){
        if(session.getAttribute("infoSession") != null){
            return "addMember";
        }else{
            return "login";
        }
    }

    @PostMapping("/addMember")
    public String addMember(@ModelAttribute MemberModel member, HttpSession session, Model model, RedirectAttributes redirectAttributes){
        LoginModel login = (LoginModel) session.getAttribute("infoSession");

        if(login != null){
            member.setProviderId(login.getProvider().getProviderId());
            String message = infoService.addMember(member);
            redirectAttributes.addFlashAttribute("message", message);
            return "redirect:dashboard";
        }else{
            return "login";
        }

    }

    @GetMapping("/newRecord")
    public String newRecord(HttpSession session, Model model){
        LoginModel login = (LoginModel) session.getAttribute("infoSession");

        if(login != null){

            List<String> getMemberList = infoService.getMemberList(login.getProvider().getProviderId());

            SimpleDateFormat simpleformat = new SimpleDateFormat("E, dd MMM yyyy");
            simpleformat = new SimpleDateFormat("MMM");
            String strMonth = simpleformat.format(new Date());

            model.addAttribute("month", strMonth);
            model.addAttribute("memberList", getMemberList);
            return "newRecord";
        }else{
            return "login";
        }
    }

    @PostMapping("/newRecord")
    public String newRecord(@RequestParam String month, @RequestParam String memList, HttpSession session, Model model, RedirectAttributes redirectAttributes){
        LoginModel login = (LoginModel) session.getAttribute("infoSession");

        if(login != null){

            String str[] = memList.split(",");
            List<String> mList = new ArrayList<String>();
            mList = Arrays.asList(str);

            String message = infoService.addNewRecord(month, mList, login.getProvider().getProviderId());

            redirectAttributes.addFlashAttribute("message", message);
            return "redirect:dashboard";
        }else{
            return "login";
        }
    }

}
