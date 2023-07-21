package com.denis.talental.repositories;

import java.util.List;

import com.denis.talental.models.Job;
import com.denis.talental.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JobRepo extends CrudRepository<Job, Long> {
    List<Job> findAll();
    List<Job> findByLeadId(Long leadId);
    List<Job> findAllByUsers(User user);
    List<Job> findByUsersNotContains(User user);
}
