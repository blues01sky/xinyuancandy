package util;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.apache.log4j.Logger;

public class DateUtil {

	protected static Logger logger = Logger.getLogger(DateUtil.class);

	public String getOrderIdByTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String newDate = sdf.format(new java.util.Date());
		String result = "";
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
			result += random.nextInt(10);
		}
		return newDate + result;
	}

	public String getDateNow() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		return df.format(new java.util.Date());
	}

	public String getDateTimeNow() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		return df.format(new java.util.Date());
	}

	public Date getTimeTypeDate() {

		java.util.Date utilDate = new java.util.Date(); // 获取当前时间

		java.sql.Date date = new java.sql.Date(utilDate.getTime());

		return date;
	}

	public Timestamp getDateTimeTypeSql() {
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

		java.sql.Timestamp datetime = java.sql.Timestamp.valueOf(nowTime);
		logger.info("获取系统当前时间" + datetime);
		return datetime;
	}

}
