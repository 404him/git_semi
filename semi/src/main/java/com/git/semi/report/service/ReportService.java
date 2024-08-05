package com.git.semi.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.git.semi.report.dao.ReportDao;
import com.git.semi.report.vo.ReportVo;

@Service
public class ReportService {

    private final ReportDao reportDao;

    @Autowired
    public ReportService(ReportDao reportDao) {
        this.reportDao = reportDao;
    }

    public void reportNews(int reporterId, int newsId) {
        ReportVo report = new ReportVo();
        report.setRep_reporter_idx(reporterId);
        report.setRep_type("뉴스");
        report.setNews_idx(newsId);
        reportDao.insertReport(report);
    }

    public void reportMember(int reporterId, int memberId) {
        ReportVo report = new ReportVo();
        report.setRep_reporter_idx(reporterId);
        report.setRep_type("회원");
        report.setMem_idx(memberId);
        reportDao.insertReport(report);
        checkAndDeleteMember(memberId);
    }

    public void reportReply(int reporterId, int replyId) {
        ReportVo report = new ReportVo();
        report.setRep_reporter_idx(reporterId);
        report.setRep_type("댓글");
        report.setRpy_idx(replyId);
        reportDao.insertReport(report);
    }

    private void checkAndDeleteMember(int memberId) {
        int reportCount = reportDao.getReportCountByMember(memberId);
        if (reportCount >= 2) {
            reportDao.deleteMember(memberId);
        }
    }

    public void deleteMember(int memberId) {
        reportDao.deleteMember(memberId);
    }

    public List<ReportVo> getAllReports() {
        return reportDao.getAllReports();
    }

    // 이미 신고했는지 체크용 메소드
    public int checkReportByIdx(int idx, int mem_idx, String rep_type) {

        // 넘기기전 map에 담기.
        Map<String, Object> map = new HashMap<>();
        map.put("idx", idx);
        map.put("mem_idx", mem_idx);
        map.put("rep_type", rep_type);

        return  reportDao.checkReportByIdx(map);
    }

    public int InsertReportByIdx(int idx, int mem_idx, String rep_type) {
        Map<String, Object> map = new HashMap<>();
        map.put("idx", idx);
        map.put("mem_idx", mem_idx);
        map.put("rep_type", rep_type);

        return reportDao.insertReport(map);
    }

    public int deleteRep_typeDataByIdx(int idx, String rep_type) {
        Map<String, Object> map = new HashMap<>();
        map.put("idx", idx);
        map.put("rep_type", rep_type);
        return reportDao.deleteRep_typeDataByIdx(map);

    }

    public int unlockMember(int mem_idx) {
        return reportDao.unlockMember(mem_idx);
    }
}
