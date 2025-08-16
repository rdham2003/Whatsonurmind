package tech_rdham.pro.Whatsonurmind.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import tech_rdham.pro.Whatsonurmind.Model.User;
import tech_rdham.pro.Whatsonurmind.Service.UserService;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/save")
    public ResponseEntity<User> saveUser(){
        User newUser = new User("rdham2003", "password1234", "dham0011@umn.edu");
        userService.createUser(newUser);
        return ResponseEntity.ok(newUser);
    }
}
