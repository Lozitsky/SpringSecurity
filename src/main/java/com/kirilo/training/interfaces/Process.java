package com.kirilo.training.interfaces;

import org.springframework.security.access.annotation.Secured;

public interface Process {
@Secured("ROLE_ADMIN")
//    @RolesAllowed("ROLE_ADMIN")
    String getMessage();
}
