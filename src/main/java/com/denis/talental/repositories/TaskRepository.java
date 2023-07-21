package com.denis.talental.repositories;

import java.util.List;


import com.denis.talental.models.Task;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
    List<Task> findAll();
    List<Task> findByJobIdIs(Long id);
}
