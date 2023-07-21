package com.denis.talental.services;

import java.util.List;
import java.util.Optional;
import com.denis.talental.models.Job;
import com.denis.talental.models.User;
import com.denis.talental.repositories.JobRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class JobService {
    private final JobRepo jobRepo;

    @Autowired
    public JobService(JobRepo jobRepo) {
        this.jobRepo = jobRepo;
    }
    public List<Job> getJobsByLeadId(Long leadId) {
        return jobRepo.findByLeadId(leadId);
    }

    public JobRepo getJobRepo() {
        return jobRepo;
    }

    public List<Job> getAllJobs() {
        return jobRepo.findAll();
    }


    public List<Job> allJobs(){
        return jobRepo.findAll();
    }

    public Job updateJob(Job job) {
        return jobRepo.save(job);
    }

    public List<Job> getAssignedJobs(User user){
        return jobRepo.findAllByUsers(user);
    }

    public List<Job> getUnassignedJobs(User user){
        return jobRepo.findByUsersNotContains(user);
    }

    public Job addJob(Job job) {
        return jobRepo.save(job);
    }

    public void deleteJob(Job job) {
        jobRepo.delete(job);
    }

    public Job findById(Long id) {
        Optional<Job> optionalJob = jobRepo.findById(id);
        if(optionalJob.isPresent()) {
            return optionalJob.get();
        }else {
            return null;
        }
    }

}
