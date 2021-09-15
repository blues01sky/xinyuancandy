package main.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class Demo1 {

	@ResponseBody
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	private String test1() {
		// TODO Auto-generated method stub

		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
		java.sql.Timestamp datatime = java.sql.Timestamp.valueOf(nowTime);

		System.out.println(datatime);
		return "success";
	}

}
