package com.denis.talental.models;


import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
    @Table(name="tasks")
    public class Task {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Size(min=3, message="Name must be at least 3 characters long")
        private String name;

        @Column(updatable=false)
        @DateTimeFormat(pattern="yyyy-MM-dd")
        private Date createdAt;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name="task_id")
        private User creator;

        @PrePersist
        protected void onCreate(){
            this.createdAt = new Date();
        }

        @ManyToOne(fetch=FetchType.LAZY)
        @JoinColumn(name="job_id")
        private Job job;

        public Task() {}

        public Task(String name) {
            this.name = name;
        }

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Date getCreatedAt() {
            return createdAt;
        }

        public void setCreatedAt(Date createdAt) {
            this.createdAt = createdAt;
        }

        public Job getJob() {
            return job;
        }

        public void setJob(Job job) {
            this.job = job;
        }

        public User getCreator() {
            return creator;
        }

        public void setCreator(User creator) {
            this.creator = creator;
        }

    }
