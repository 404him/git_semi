package com.git.semi.report.controller;

import java.net.http.HttpClient;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.git.semi.member.vo.MemberVo;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.git.semi.report.service.ReportService;
import com.git.semi.report.vo.ReportVo;

@Controller
public class ReportController {

    private final ReportService reportService;

    @Autowired
    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @PostMapping("/reportNews")
    public String reportNews(@RequestParam("newsId") int newsId, HttpSession session, RedirectAttributes redirectAttributes) {
        
    	// 이미 신고가 되었는지 판단하기 위해 db에 접근해 select하기.

    	int reporterId = (int) session.getAttribute("userId");
        reportService.reportNews(reporterId, newsId);
        redirectAttributes.addFlashAttribute("message", "뉴스가 신고되었습니다.");
        return "redirect:/home";
    }

    @PostMapping("/reportMember")
    public String reportMember(@RequestParam("memberId") int memberId, HttpSession session, RedirectAttributes redirectAttributes) {
        int reporterId = (int) session.getAttribute("userId");
        reportService.reportMember(reporterId, memberId);
        redirectAttributes.addFlashAttribute("message", "회원이 신고되었습니다.");
        return "redirect:/home";
    }

    @PostMapping("/reportReply")
    public String reportReply(@RequestParam("replyId") int replyId, HttpSession session, RedirectAttributes redirectAttributes) {
        int reporterId = (int) session.getAttribute("userId");
        reportService.reportReply(reporterId, replyId);
        redirectAttributes.addFlashAttribute("message", "댓글이 신고되었습니다.");
        return "redirect:/home";
    }

    @PostMapping("/deleteMember")
    public String deleteMember(@RequestParam("mem_idx") int mem_idx, RedirectAttributes redirectAttributes) {
        reportService.deleteMember(mem_idx);
        redirectAttributes.addFlashAttribute("message", "회원이 삭제되었습니다.");
        return "redirect:/report";
    }


    /**
     * 신고 리스트 조회
     */
    @GetMapping("/report.do")
    public String viewReports(Model model) {
        List<ReportVo> reports = reportService.getAllReports();
        model.addAttribute("reports", reports);
        return "report/report";
    }

    /**
     * 신고 하기.
     * @param idx : member,news,reply들의 idx
     * @param rep_type : idx를 구분하기 위한 타입
     * @param session : 로그인 유저의 정보를 가져오기 위한 스코프.
     * @return
     */
    @RequestMapping(value = "/reportByIdx.do",
            produces = "application/json; charset=utf-8;")
    @ResponseBody
    public String checkAndInsertReport(@RequestParam("idx") int idx,@RequestParam("rep_type") String rep_type, HttpSession session) {

        System.out.println("idx = " + idx);
        System.out.println("rep_type = " + rep_type);
        // 로그인한 사용자 == 신고를 하는 사람(Report테이블의 rep_reporter_idx)
        int mem_idx = ((MemberVo)session.getAttribute("user")).getMem_idx();

        System.out.println("mem_idx = " + mem_idx);

        // 신고한 내역이 있는지 조회. 있으면 result > 0
        int result = reportService.checkReportByIdx(idx, mem_idx, rep_type);

        System.out.println("result : "+result);
        // 신고 추가에 대한 결과값 초기화.
        int insertResult = 0;

        JSONObject json = new JSONObject();
        if(result > 0) {
            //return String.valueOf(0);
            json.put("result", "이미 신고되었습니다.");
        }else {
            // 신고 내역이 없으므로 신고 테이블에 추가하기.
            insertResult = reportService.InsertReportByIdx(idx, mem_idx, rep_type);
               
	        System.out.println("insertResult : "+insertResult);
	        // insert 후 결과값에 따른 리턴값 주기.
	        if(insertResult > 0) {
	            //return "312313";
	        	json.put("result", "신고되었습니다.");
	        } else {
	        	json.put("result", "신고 실패!");
	        }
        }
        
        return json.toString();

    }

    /**
     * 신고된 타입의 db에서 idx로 해당 data 삭제하기.
     * @param idx : 타입에 관한 data의 고유 번호
     * @param rep_type : 신고 타입
     * @return : 신고 조회 페이지
     */
    @RequestMapping(value = "/deleteReport.do")
    public String deleteReport(@RequestParam("idx") int idx,@RequestParam("rep_type") String rep_type) {

        // rep_type에 해당하는 테이블에 idx인 데이터 삭제.
        int result = reportService.deleteRep_typeDataByIdx(idx, rep_type);

        if (result > 0) {
            return "redirect:/report.do";
        }else {
            return "신고된 데이터 삭제 실패!";

        }

    }


}
