package com.applova.io.Controller;


import domain.CaptchaResponse;
import domain.Response;
import domain.User;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


import java.net.URI;

@Controller
public class UserController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(ModelMap model){
        model.addAttribute("message",new User());
        return "form";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public String formSubmit( @RequestBody Response captchaResponse) {

//        final String uri = "http://localhost:8081/submit";
//        User obj = new User();
//        obj.setName(user.getName());
//        obj.setDescription(user.getDescription());
//        obj.setResponse(user.getResponse());

        UriComponents verifyResponse = UriComponentsBuilder.fromHttpUrl("https://www.google.com/recaptcha/api/siteverify?secret=6Lc21r0UAAAAAPZLOSu98dTXCDu0Z8PZAgKPPJcp&response="+captchaResponse.getResponse()).build();

        System.out.println(verifyResponse);
        String verifiedStr = verifyResponse.toUriString();

        HttpHeaders requestHeaders = new HttpHeaders();
        requestHeaders.add("Content-Type", "application/json");
        HttpEntity entity = new HttpEntity(requestHeaders);
        ResponseEntity<CaptchaResponse> response = restTemplate.exchange(verifiedStr, HttpMethod.POST,entity,CaptchaResponse.class);

        System.out.println(response.getBody());

        if (response.getBody().success == "true"){
//            Object addeduser = restTemplate.postForObject( uri, obj, Object.class);
//            model.addAttribute("message", addeduser);

            return "res";
        }
        else{
            return "redirect:/index";
      }



    }


}