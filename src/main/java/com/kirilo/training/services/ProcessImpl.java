package com.kirilo.training.services;

import com.kirilo.training.interfaces.Process;
import org.springframework.stereotype.Service;

//@Service(service)
@Service
public class ProcessImpl  implements Process {
    @Override
    public String getMessage() {
        return "some message";
    }
}
