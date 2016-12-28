package net.msg.em.match;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import net.msg.em.login.LoginController;
import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.StadiumVO;
import net.msg.em.vo.T_MVO;
import net.msg.em.vo.TeamVO;

@Controller
@RequestMapping("match")
public class MatchController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MatchService matchService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView matchGET(){
		
		List<MatchVO> list = new ArrayList<MatchVO>();
		try {
			list = matchService.getMatchingList();
			logger.info(list.toString());
			ModelAndView mav = new ModelAndView("match/match");
			mav.addObject("list", list);
			
			return mav;
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "리스트가 없습니다..");
			mav.addObject("url", "../");
			return mav;
		}
	}
	@RequestMapping(value="matchingScheduleJSON", method=RequestMethod.GET,
			headers="Accept=application/json;charset=UTF-8",
			produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<MatchVO> matchingJSON() throws Exception{
		return matchService.getMatchingDayList();	
	}
	
	@RequestMapping(value="matchingSchedule")
	public ModelAndView matchingSchedule(int year, int month, int date){
		String schedule = String.valueOf(year)+"-"+String.valueOf(month)+"-"+String.valueOf(date);
		
		try {
			Map<String, Integer> cal_map = new HashMap<String, Integer>();
			cal_map.put("year", year);
			cal_map.put("month", month);
			
			MatchCalendar cal = new MatchCalendar();
			int[][] calendar = cal.createCalendar(cal_map);
			
			List<MatchVO> list = matchService.getMatchingDayDetail(schedule);
			ModelAndView mav = new ModelAndView("match/matchingSchedule");
			mav.addObject("calendar", calendar);
			mav.addObject("cal_map", cal_map);
			mav.addObject("schedule", schedule);
			mav.addObject("list", list);
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="goMatching", method=RequestMethod.GET)
	public ModelAndView goMatchingGET(HttpSession session){
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		int[] p = {3, 7, 25, 49};
		
		List<StadiumVO> list = new ArrayList<StadiumVO>();
		
		try {
			MemberVO memberVO = matchService.getMember(memberInfo.getM_no());
			
			logger.info(memberVO.toString());
			
			if(memberVO.getM_admin()==3){  //맴버 admin이 3일 때
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder parser = dbf.newDocumentBuilder();
				String URL = "http://openapi.gg.go.kr/PublicTrainingFacilitySoccer?key=c38ff4110d86469088f5292ae2cf4fc4";
				
				Document xmlDoc = parser.parse(URL);
				
				Element root = xmlDoc.getDocumentElement();
				
				NodeList rowList = root.getElementsByTagName("row");
				
				for(int i=0; i<rowList.getLength(); i++){
					StadiumVO svo = new StadiumVO();
					Node rowNode = rowList.item(i);
					Element rowElement = (Element) rowNode;
					
					NodeList valList = rowNode.getChildNodes();
					
					for(int j=0; j<p.length; j++){
						Node sNode = valList.item(p[j]);
						Element rowElement2 = (Element) sNode;
						
						switch(j){
							case 0:
								svo.setSIGUN_NM(rowElement2.getTextContent());break;
							case 1:
								svo.setFACLT_NM(rowElement2.getTextContent());break;
							case 2:
								svo.setBOTM_MATRL_NM(rowElement2.getTextContent());break;
							case 3:
								svo.setREFINE_LOTNO_ADDR(rowElement2.getTextContent());break;
							default:break;	
						}
					}
					list.add(svo);
				}
				return new ModelAndView("match/goMatching", "list", list);
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "주장만 신청할 수 있습니다.");
				mav.addObject("url", "../");
				return mav;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "주장만 신청할 수 있습니다.");
			mav.addObject("url", "../");
			return mav;
		}
	}
	
	@RequestMapping(value="goMatching", method=RequestMethod.POST)
	public ModelAndView goMatchingPOST(MatchVO matchVO, HttpSession session){
		
		int endTimeHour = Integer.parseInt(matchVO.getMat_time_time_end().substring(0, 2));
		int startTimeHour = Integer.parseInt(matchVO.getMat_time_time_start().substring(0, 2));
		
		int endTimeMin = Integer.parseInt(matchVO.getMat_time_time_end().substring(3, 5));
		int startTimeMin = Integer.parseInt(matchVO.getMat_time_time_start().substring(3, 5));
		
		int mat_play_time = (endTimeHour-startTimeHour)*60 + (endTimeMin-startTimeMin);
		
		matchVO.setMat_play_time(mat_play_time);
		
		matchVO.setMat_time(matchVO.getMat_time_date()+" "+matchVO.getMat_time_time_start());
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		try {
			MemberVO memberVO = matchService.getMember(memberInfo.getM_no());
			TeamVO teamVO = matchService.getTeam(memberVO.getT_no());
			
			matchVO.setMat_home(memberVO.getT_no());
			matchVO.setMat_home_name(teamVO.getT_name());
			
			int in_check = matchService.insertMatching(matchVO); //******** match 생성 *************
			
			List<T_MVO> list = matchService.searchMatNo(teamVO.getT_no());
			
			Object obj = list.get(list.size()-1);
			long mat_no = (Long) obj;
			
			Map<String, Long> map = new HashMap<String, Long>();
			map.put("t_no", teamVO.getT_no());
			map.put("mat_no", mat_no);
			if(in_check == 1){ // match생성이 잘 되면
				int tm_check = matchService.insertTeam_Matching(map); //t_m에 mat_no, t_no 삽입
					if(tm_check == 1){
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "매칭신청 완료");
						mav.addObject("url", "../");
						return mav;
					}else{
						throw new RuntimeException();
					}
			}else{
				throw new RuntimeException();
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "매칭신청 실패");
			mav.addObject("url", "../");
			return mav;
		}
	}
	
	@RequestMapping(value="{mat_no}/awayMatching", method=RequestMethod.GET)
	public ModelAndView awayMatchingGET(@PathVariable long mat_no, HttpSession session){
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		try {
			MemberVO memberVO = matchService.getMember(memberInfo.getM_no());
			
			if(memberVO.getM_admin() == 3){//팀의 주장만 신청가능
				
				MatchVO matchVO = matchService.getMatch(mat_no);
				
				if(matchVO.getMat_home() != (memberVO.getT_no())){//홈팀이 자신의 팀이 아닐때만 신청가능
				
					if(matchVO.getMat_away()==1){//away팀이 없을 경우만 신청가능
						TeamVO teamVO = matchService.getTeam(memberVO.getT_no());
						Map<String, Object> mat_map = new HashMap<String, Object>();
						mat_map.put("t_no", memberVO.getT_no());
						mat_map.put("mat_no", matchVO.getMat_no());
						mat_map.put("mat_away_name", teamVO.getT_name());
						int mat_up_check = matchService.awayTeamUpdate(mat_map);
											
							if(mat_up_check==1){//매칭 업데이트가 됬을 때, t_m 에 어웨이팀 matching선정
								Map<String, Long> map = new HashMap<String, Long>();
								map.put("t_no", teamVO.getT_no());
								map.put("mat_no", mat_no);
								
								int tm_check = matchService.insertTeam_Matching(map);
								
								if(tm_check==1){//t_m 테이블에 추가가 됬을 때
									ModelAndView mav = new ModelAndView("result");
									mav.addObject("msg", "신청이 완료되었습니다.");
									mav.addObject("url", "../");
									return mav;
								}else{
									ModelAndView mav = new ModelAndView("result");
									mav.addObject("msg", "팀 업데이트 실패");
									mav.addObject("url", "../");
									return mav;
								}
							}else{
								ModelAndView mav = new ModelAndView("result");
								mav.addObject("msg", "매칭 업데이트 실패");
								mav.addObject("url", "../");
								return mav;
							}
						
					}else{
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "이미 매칭이 완료되었습니다.");
						mav.addObject("url", "../");
						return mav;
					}
			
				}else{
					ModelAndView mav = new ModelAndView("result");
					mav.addObject("msg", "이건 우리 팀이 신청한 겁니다..");
					mav.addObject("url", "../");
					return mav;
				}
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "주장만 할 수 있습니다.");
				mav.addObject("url", "../");
				return mav;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "신청 중 에러..");
			mav.addObject("url", "../");
			return mav;
		}
	}
	@RequestMapping(value="complete")
	public ModelAndView complete(){
		try {
			List<MatchVO> list = matchService.getMatchingComplete();
			logger.info(list.toString());
			return new ModelAndView("match/matchComplete", "list", list);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@RequestMapping(value="{mat_no}/homeDelete/{t_no}", method=RequestMethod.GET)
	public ModelAndView homeDeleteGET(@PathVariable long mat_no, @PathVariable long t_no, HttpSession session){//홈팀이 매칭취소 할 때
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		try {
			MemberVO memberVO = matchService.getMember(memberInfo.getM_no());
			if(memberVO.getM_admin() == 3){//주장일 때만 삭제 가능
				int del_check = matchService.deleteHomeMatching(mat_no);
				if(del_check ==1){//t_matching에서 mat_no 삭제 될 때
					int del_tm_check = matchService.deleteHomeMatchingTM(mat_no);
					if(del_tm_check == 1){
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "매칭 삭제 완료");
						mav.addObject("url", "../../../team/");
						return mav;						
					}else{
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "t_m테이블 삭제 오류");
						mav.addObject("url", "../../../team/");
						return mav;
					}
				}else{
					ModelAndView mav = new ModelAndView("result");
					mav.addObject("msg", "매칭 삭제 실패");
					mav.addObject("url", "../../../team/");
					return mav;
				}
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "주장만 할 수 있습니다.");
				mav.addObject("url", "../../../team/");
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "매칭 삭제 실패..");
			mav.addObject("url", "../../../team/");
			return mav;
		}
	}
	@RequestMapping(value="{mat_no}/awayDelete/{t_no}", method=RequestMethod.GET)
	public ModelAndView awayDeleteGET(@PathVariable long mat_no, @PathVariable long t_no, HttpSession session){//어웨이팀이 매칭취소 할 때
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		try {
			MemberVO memberVO = matchService.getMember(memberInfo.getM_no());
			if(memberVO.getM_admin() == 3){//주장일 때만 삭제 가능
				int up_check = matchService.updateAwayMatching(mat_no);//t_matching에서 away팀 변경
				logger.info("up_check " + up_check);
				if(up_check ==1){//변경됬을 때
					Map<String, Long> map = new HashMap<String, Long>();
					map.put("mat_no", mat_no);
					map.put("t_no", t_no);
					logger.info(map.toString());
					int del_tm_check = matchService.deleteAwayMatchingTM(map);
					logger.info("del_tm_check " + del_tm_check);
					if(del_tm_check ==1){
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "매칭 삭제 완료");
						mav.addObject("url", "../../../team/");
						return mav;
					}else{
						ModelAndView mav = new ModelAndView("result");
						mav.addObject("msg", "매칭 삭제 실패");
						mav.addObject("url", "../../../team/");
						return mav;
					}
				}else{
					ModelAndView mav = new ModelAndView("result");
					mav.addObject("msg", "매칭 삭제 실패");
					mav.addObject("url", "../../../team/");
					return mav;
				}
			}else{
				ModelAndView mav = new ModelAndView("result");
				mav.addObject("msg", "주장만 할 수 있습니다.");
				mav.addObject("url", "../../../team/");
				return mav;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView("result");
			mav.addObject("msg", "매칭 삭제 실패..");
			mav.addObject("url", "../../../team/");
			return mav;
		}
	}
}
