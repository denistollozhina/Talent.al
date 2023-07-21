package com.denis.talental.services;

import com.denis.talental.models.Task;
import com.denis.talental.repositories.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepo;



    public List<Task> allTasks(){
        return taskRepo.findAll();
    }

    public List<Task> jobTasks(Long jobId){
        return taskRepo.findByJobIdIs(jobId);
    }

    public TaskRepository getTaskRepo() {
        return taskRepo;
    }

    public TaskService(TaskRepository taskRepo) {
        this.taskRepo = taskRepo;
    }

    public void setTaskRepo(TaskRepository taskRepo) {
        this.taskRepo = taskRepo;
    }

    public Task addTask(Task task) {
        return taskRepo.save(task);
    }

    public void deleteTask(Task task) {
        taskRepo.delete(task);
    }
}
