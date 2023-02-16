package com.issac.react.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.issac.react.dto.JobStatusCntDTO;
import com.issac.react.dto.MonthlyAppDTO;
import com.issac.react.entity.CompanyJob;

@Repository
public interface CompanyJobRepo extends JpaRepository<CompanyJob, String> {

	@Query("select new com.issac.react.dto.JobStatusCntDTO(c.jobStatus, COUNT(c.jobStatus)) "
			+ "FROM CompanyJob c WHERE c.createdBy = :createdBy GROUP BY c.jobStatus")
	List<JobStatusCntDTO> getStatusCnt(String createdBy);
	
	
	@Query("select new com.issac.react.dto.MonthlyAppDTO( date_part('year', c.createdTs) yr,"
			+ "date_part('month', c.createdTs) mth, count(c.createdTs) cnt  ) "
			+ "FROM CompanyJob c WHERE c.createdBy = :createdBy "
			+ "group by date_part('year', c.createdTs), date_part('month', c.createdTs) "
			+ "order by 1 desc, 2 desc limit :limit")
	List<MonthlyAppDTO> getMonthlyApp(String createdBy, int limit);

}

