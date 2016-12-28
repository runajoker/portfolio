package net.msg.em.match;

import java.util.Calendar;
import java.util.Map;

public class MatchCalendar {
	
	int[][] calendar = new int[6][7];
	
	public int[][] createCalendar(Map<String, Integer> cal_map) {
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, cal_map.get("year"));
		cal.set(Calendar.MONTH, cal_map.get("month")-1);
		cal.set(Calendar.DATE, 1);
		
		Calendar last_cal = Calendar.getInstance();
		last_cal.set(Calendar.MONTH, cal.get(Calendar.MONTH)-1);
		
		int startDay = cal.get(Calendar.DAY_OF_WEEK);
		int endDay = cal.getActualMaximum(Calendar.DATE);
		int last_endDay = last_cal.getActualMaximum(Calendar.DATE);
		int inputDate = 1;
		
		
		for(int row=0; row<calendar.length; row++){
			for(int col=0; col<calendar[row].length; col++){
				if(row==0){
					if(col<startDay-1){
						calendar[row][col] = 0;
					}else{
						calendar[row][col] = inputDate;
						inputDate++;
					}
				}else{
					if(inputDate <= endDay){
						calendar[row][col] = inputDate;
						inputDate++;
					}else{
						calendar[row][col] = 0;
					}
				}
			}
		}
		return calendar;
	}
	
}