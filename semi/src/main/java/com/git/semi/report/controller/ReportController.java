package com.git.semi.report.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/report.do")
    public String viewReports(Model model) {
        List<ReportVo> reports = reportService.getAllReports();
        model.addAttribute("reports", reports);
        return "report/report";
    }
}
