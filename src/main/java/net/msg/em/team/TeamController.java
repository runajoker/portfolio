package net.msg.em.team;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.msg.em.vo.MatchVO;
import net.msg.em.vo.MemberVO;
import net.msg.em.vo.TeamVO;

@Controller
@RequestMapping("team")
public class TeamController {
   
   private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
   
   @Autowired
   private TeamService teamService;
   
   @RequestMapping(value="/", method=RequestMethod.GET)
   public ModelAndView teamGet(HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         if(memberVO.getT_no()==1){
            List<TeamVO> teamList = teamService.getTeamList();
            logger.info("teamList : " + teamList.toString()+"확인");
            return new ModelAndView("team/noHaveTeam", "teamList", teamList);
         }else{
            TeamVO teamInfo = teamService.getTeam2(memberVO);
            List<MatchVO> list = teamService.getTeamMatchingList(memberVO.getT_no());
            
            ModelAndView mav = new ModelAndView("team/team");
            mav.addObject("teamInfo", teamInfo);
            mav.addObject("list", list);
            return mav;
         }
      }catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", e.getMessage());
         mav.addObject("uri", "../");
         return mav;
      }
   }
   
   @RequestMapping(value="insert", method=RequestMethod.GET)
   public String insertTeamGET(){
      return "team/insertTeam";
   }
   
   @RequestMapping(value="insert", method=RequestMethod.POST)
   public ModelAndView insertTeamGET(TeamVO teamVO, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      //TeamVO teamInfo = null;
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         teamVO.setT_captain(memberVO.getM_name());
         teamVO.setT_captain_no(memberVO.getM_no());
         
         int in_check = teamService.insertTeam(teamVO);//팀 만들기
         
         if(in_check==0){
            throw new RuntimeException("팀 생성 실패..");
         }else{
            teamService.updateCaptain(memberVO.getM_no());
            logger.info("(memberVO.getM_no() : " + memberVO.getM_no());
         }
         
         
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "팀 생성 성공");
         mav.addObject("url", "../team/");
         return mav;
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "팀 생성 실패");
         mav.addObject("url", "../");
         return mav;
      }
   }

   
   @RequestMapping(value="update", method=RequestMethod.GET)
   public ModelAndView updateTeamGET(HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
         try {
            MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
            
            TeamVO teamInfo = teamService.getTeam(memberVO.getT_no());
            
            logger.info("update Get : " + teamInfo.toString());
            return new ModelAndView("team/updateTeam", "teamInfo", teamInfo);
            
         }catch (Exception e) {
            ModelAndView mav = new ModelAndView("result");
            mav.addObject("msg", e.getMessage());
            mav.addObject("uri", "../");
            return mav;
         }
   }
   
   @RequestMapping(value="update", method=RequestMethod.POST)
   public ModelAndView updateTeamPOST(TeamVO teamVO, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      TeamVO teamInfo = null;
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         teamInfo = teamService.getTeam(memberVO.getT_no());
         
         teamVO.setT_no(teamInfo.getT_no());
         
         teamService.updateTeam(teamVO);
         logger.info("update Post : " + teamVO.toString());
         
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "수정 성공");
         mav.addObject("url", "../team/");
         return mav;
         
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "수정 실패");
         mav.addObject("url", "javascript:history.back();");
         return mav;
      }
      
   }
   
   
   @RequestMapping(value="delete", method=RequestMethod.GET)
   public ModelAndView deleteTeamGET(HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         TeamVO teamInfo = teamService.getTeam2(memberVO);
         
         logger.info("delete Get : " + teamInfo.toString());
         return new ModelAndView("team/deleteTeam", "teamInfo", teamInfo);
         
      }catch (Exception e) {
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", e.getMessage());
         mav.addObject("uri", "../");
         return mav;
      }
   }
   
   @RequestMapping(value="delete", method=RequestMethod.POST)
   public ModelAndView deleteTeamPOST(@RequestParam String m_pw, @RequestParam int t_no, TeamVO teamVO, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      logger.info("memberInfo : " + memberInfo.toString());
      
      TeamVO teamInfo = null;
      logger.info("MDH : " + m_pw.toString());
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         
         logger.info("m_pw : " + m_pw + ", t_no : " + t_no);
         
         teamVO.setT_no(t_no);
         memberVO.setM_pw(m_pw);
         logger.info("m2e2mVO : " + memberVO.toString());
         
         int a = teamService.checkDelTeam(memberVO);
         
         logger.info("checkDelTeam : " + a);
         
         
         if(a == 0){
            throw new RuntimeException();
            
      
         } else {
            int b = teamService.delchangememTeam(memberVO);
            teamService.deleteTeam(teamVO);
         }
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "삭제 성공");
         mav.addObject("url", "../team/");
         return mav;
         
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "비밀번호 확인 하세요");
         mav.addObject("url", "javascript:history.back();");
         return mav;
      }
   }
   
   
   @RequestMapping(value="/{t_no}/", method=RequestMethod.GET)
   public ModelAndView joinTeamGet(@PathVariable int t_no){
      
      try {
         TeamVO teamInfo = teamService.getTeam(t_no);
         return new ModelAndView("team/joinTeam", "teamInfo", teamInfo);
         
      }catch (Exception e) {
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", e.getMessage());
         mav.addObject("uri", "../");
         return mav;
      }
   }
   
   @RequestMapping(value="/{t_no}/", method=RequestMethod.POST)
   public ModelAndView joinTeamPost(@PathVariable int t_no, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      TeamVO teamInfo = null;
      try {
         memberInfo.setT_no(t_no);
         teamService.joinTeam(memberInfo);
         
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "가입 성공");
         mav.addObject("url", "../");
         return mav;
         
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "가입 실패");
         mav.addObject("url", "javascript:history.back();");
         return mav;
      }
   }
   
   
   @RequestMapping(value="withdraw", method=RequestMethod.GET)
   public ModelAndView withdrawTeamGET(HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         TeamVO teamInfo = teamService.getTeam2(memberVO);
         
         return new ModelAndView("team/withdrawTeam", "teamInfo", teamInfo);
         
      }catch (Exception e) {
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", e.getMessage());
         mav.addObject("uri", "../");
         return mav;
      }
   }
   
   @RequestMapping(value="withdraw", method=RequestMethod.POST)
   public ModelAndView withdrawTeamPOST(@RequestParam String m_pw, @RequestParam int t_no, TeamVO teamVO, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      
      TeamVO teamInfo = null;
      logger.info("MDH : " + m_pw.toString());
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         
         logger.info("m_pw : " + m_pw + ", t_no : " + t_no);
         
         teamVO.setT_no(t_no);
         memberVO.setM_pw(m_pw);
         
         int a = teamService.checkDelTeam(memberVO);
         if(a == 0){
            throw new RuntimeException();
         } else {
            teamService.withdrawTeam(memberInfo.getM_no());
         }
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "탈퇴 성공");
         mav.addObject("url", "../team/");
         return mav;
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "비밀번호 확인 하세요");
         mav.addObject("url", "javascript:history.back();");
         return mav;
      }
   }
   
   @RequestMapping(value="entrust", method=RequestMethod.GET)
   public ModelAndView entrustTeamGET(HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
         TeamVO teamInfo = teamService.getTeam2(memberVO);
         
         List<TeamVO> teamMemInfo = teamService.getTeamMemList(memberVO);
         logger.info("Entrust teamMemInfo" + teamMemInfo.toString());
         ModelAndView mav = new ModelAndView("team/entrust");
         mav.addObject("teamMemInfo", teamMemInfo);
         mav.addObject("teamInfo", teamInfo);
      
         return mav;
      }catch (Exception e) {
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", e.getMessage());
         mav.addObject("uri", "../");
         return mav;
      }
   }
   
   
   @RequestMapping(value="entrust", method=RequestMethod.POST)
   public ModelAndView entrustTeamPOST(@RequestParam String m_pw, @RequestParam int t_no, @RequestParam int m_no, TeamVO teamVO, HttpSession session){
      MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
      TeamVO teamInfo = null;
      logger.info("MDH : " + m_pw.toString());
      try {
         MemberVO memberVO = teamService.getMember(memberInfo.getM_no());
   
         logger.info("memberVO12121 : " + memberVO);
         memberVO.setM_pw(m_pw);
         
         teamVO.setT_captain_no(m_no);
         teamVO.setT_no(t_no);
         int a = teamService.checkDelTeam(memberVO);
         logger.info("aaaaaaaaaaaa : " + a);
         if(a == 0){
            throw new RuntimeException();
         } else {
            
            logger.info("t_no1111 : " + t_no);
            teamService.entrustTeam(memberVO);
            teamService.upAdminTeam(m_no);
            teamService.downAdminTeam(memberInfo.getM_no());
            teamService.updateCaptain2(t_no);
            
         }
         
         
         logger.info("m_pw : " + m_pw + ", t_no : " + t_no + ", m_no : " + m_no );
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "임명 성공");
         mav.addObject("url", "../team/");
         return mav;
      } catch (Exception e) {
         e.printStackTrace();
         ModelAndView mav = new ModelAndView("result");
         mav.addObject("msg", "비밀번호 확인 하세요");
         mav.addObject("url", "javascript:history.back();");
         return mav;
      }
   }
   
   
   
   @RequestMapping(value="showteam", method=RequestMethod.GET)
      public ModelAndView showTeamGET(HttpSession session){
         MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
         try {
              List<TeamVO> teamList = teamService.getTeamList();
              logger.info("teamList : " + teamList.toString()+"확인");
               return new ModelAndView("team/showTeam", "teamList", teamList);
            
         }catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView("result");
            mav.addObject("msg", e.getMessage());
            mav.addObject("uri", "../");
            return mav;
         }
      }
}