package com.spring.bm.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class ErrorController {

	@GetMapping
	public String defaultError() {
		return "common/error-404";
	}

	@GetMapping("/no-resource")
	public String noResource() {
		return "error/noResource";
	}

	@GetMapping("/server-error")
	public String serverError() {
		return "error/serverError";
	}
}

