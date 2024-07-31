package com.git.semi.report.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.git.semi.report.vo.ReportVo;

@Repository
public class ReportDao {

    private final SqlSession sqlSession;

    @Autowired
    public ReportDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void insertReport(ReportVo report) {
        sqlSession.insert("ReportMapper.insertReport", report);
    }

    public int getReportCountByMember(int mem_idx) {
        return sqlSession.selectOne("ReportMapper.getReportCountByMember", mem_idx);
    }

    // 회원 삭제
    public void deleteMember(int mem_idx) {
        sqlSession.delete("ReportMapper.deleteMember", mem_idx);
    }

    public List<ReportVo> getAllReports() {
        return sqlSession.selectList("ReportMapper.getAllReports");
    }
}
