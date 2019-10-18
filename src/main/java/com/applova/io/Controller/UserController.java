package com.applova.io.Controller;


import domain.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class UserController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(ModelMap model){
        model.addAttribute("message",new User());
        return "form";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String formSubmit(@ModelAttribute("message") User user, Model model) {

        final String uri = "http://localhost:8081/submit";
        User obj = new User();
        obj.setName(user.getName());
        obj.setDescription(user.getDescription());

        Object addeduser = restTemplate.postForObject( uri, obj, Object.class);
        model.addAttribute("message", addeduser);
        return "show";
    }


}