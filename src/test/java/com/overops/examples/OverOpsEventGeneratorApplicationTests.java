package com.overops.examples;

import com.overops.examples.controller.Controller;
import com.overops.examples.domain.User;
import com.overops.examples.domain.UserRepository;
import com.overops.examples.service.LoggedErrorService;
import com.overops.examples.utils.EventType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("test")
public class OverOpsEventGeneratorApplicationTests {

    @Autowired
    private Controller controller;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void contextLoads() {

        int counter = 0;
        for (int i = 0; i < 100; i++) {
            for (User user : userRepository.findAll()) {
                counter++;
                controller.route(counter, user);
            }
        }
    }

}
