package com.denis.talental.controllers;

import com.denis.talental.models.Job;
import com.denis.talental.models.LoginUser;
import com.denis.talental.models.Task;
import com.denis.talental.models.User;
import com.denis.talental.services.JobService;
import com.denis.talental.services.TaskService;
import com.denis.talental.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @Autowired
    private JobService jobService;

    @Autowired
    private TaskService taskService;

    @GetMapping("/")
    public String index(Model model, @ModelAttribute("newUser") User newUser,
                        @ModelAttribute("newLogin") User newLogin, HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/dashboard";}

        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());

        return "index.jsp";
    }
    @GetMapping("/register")
    public String register (Model model, @ModelAttribute("newUser") User newUser,
                            @ModelAttribute("newLogin") User newLogin, HttpSession session) {

        return "register.jsp";
    }
    @GetMapping("/login")
    public String login (Model model, @ModelAttribute("newUser") User newUser,
                         @ModelAttribute("newLogin") User newLogin, HttpSession session) {

        return "login.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result, Model model, HttpSession session) {

        // Check if the user selected "Yes" (company) or "No" (regular user) during registration
        if (newUser.isCompany()) {
            newUser.setCompany(true); // Set the company property to true for company users
            newUser.setAccountType(User.AccountType.COMPANY); // Set accountType to COMPANY for company users
            newUser.setRole("COMPANY"); // Set role to "COMPANY" for company users
        } else {
            newUser.setCompany(false); // Set the company property to false for regular users
            newUser.setAccountType(User.AccountType.REGULAR); // Set accountType to REGULAR for regular users
            newUser.setCompanyName(null); // Clear company name for regular users
            newUser.setRole("REGULAR"); // Set role to "REGULAR" for regular users
        }

        // Save the user
        User user = userService.register(newUser, result);

        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("userId", user.getId());

        return "redirect:/login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
                        BindingResult result, Model model, HttpSession session) {

        User user = userService.login(newLogin, result);

        if(result.hasErrors() || user==null) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        // Fetch all jobs and company jobs using the JobService
        List<Job> allJobs = jobService.getAllJobs();
        List<Job> companyJobs = jobService.getAssignedJobs(user);

        model.addAttribute("user", user);
        model.addAttribute("unassignedJobs", jobService.getUnassignedJobs(user));
        model.addAttribute("assignedJobs", jobService.getAssignedJobs(user));

        // Add the allJobs and companyJobs attributes to the model
        model.addAttribute("allJobs", allJobs);
        model.addAttribute("companyJobs", companyJobs);

        return "dashboard.jsp";
    }


    @RequestMapping("/dashboard/join/{id}")
    public String joinTeam(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        Job job = jobService.findById(id);
        User user = userService.findById(userId);

        user.getJobs().add(job);
        userService.updateUser(user);

        model.addAttribute("user", user);
        model.addAttribute("unassignedJobs", jobService.getUnassignedJobs(user));
        model.addAttribute("assignedJobs", jobService.getAssignedJobs(user));

        return "redirect:/dashboard";
    }

    @RequestMapping("/dashboard/leave/{id}")
    public String leaveTeam(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        Job job = jobService.findById(id);
        User user = userService.findById(userId);

        user.getJobs().remove(job);
        userService.updateUser(user);

        model.addAttribute("user", user);
        model.addAttribute("unassignedJobs", jobService.getUnassignedJobs(user));
        model.addAttribute("assignedJobs", jobService.getAssignedJobs(user));

        return "redirect:/dashboard";
    }

    @GetMapping("/jobs/{id}")
    public String viewJob(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Job job = jobService.findById(id);
        model.addAttribute("job", job);
        return "view_job.jsp";
    }

    @GetMapping("/jobs/edit/{id}")
    public String openEditJob(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Job job = jobService.findById(id);
        model.addAttribute("job", job);
        return "edit_job.jsp";
    }

    @PostMapping("/jobs/edit/{id}")
    public String editJob(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("job") Job job,
            BindingResult result,
            HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        User user = userService.findById(userId);

        if(result.hasErrors()) {
            return "edit_job.jsp";
        }else {
            Job thisJob = jobService.findById(id);
            job.setLead(thisJob.getLead());
            job.setLead(user);
            jobService.updateJob(job);
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/jobs/delete/{id}")
    public String deleteJob(@PathVariable("id") Long id, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Job job = jobService.findById(id);
        jobService.deleteJob(job);

        return "redirect:/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.setAttribute("userId", null);
        return "redirect:/";
    }

    @GetMapping("/jobs/new")
    public String newJob(@ModelAttribute("job") Job job, HttpSession session, Model model) {
        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        model.addAttribute("userId", userId);
        return "new_job.jsp";
    }

    public UserService getUserService() {
        return userService;
    }

    public MainController(UserService userService, JobService jobService, TaskService taskService) {
        this.userService = userService;
        this.jobService = jobService;
        this.taskService = taskService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public JobService getJobService() {
        return jobService;
    }

    public void setJobService(JobService jobService) {
        this.jobService = jobService;
    }

    public TaskService getTaskService() {
        return taskService;
    }

    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @PostMapping("/jobs/new")
    public String addJob(@Valid @ModelAttribute("job") Job job, BindingResult result, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "new_job.jsp";
        }else {
            jobService.addJob(job);

            Long userId = (Long) session.getAttribute("userId");
            User user = userService.findById(userId);
            user.getJobs().add(job);
            userService.updateUser(user);
            return "redirect:/dashboard";
        }


    }

    @GetMapping("/jobs/{id}/tasks")
    public String viewJobTasks(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("task") Task task) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Job job = jobService.findById(id);
        model.addAttribute("job", job);
        model.addAttribute("tasks", taskService.jobTasks(id));
        return "tasks.jsp";
    }

    @PostMapping("/jobs/{id}/tasks")
    public String newJobTask(
            @PathVariable("id") Long id,
            HttpSession session,
            Model model,
            @Valid @ModelAttribute("task") Task task,
            BindingResult result) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Long userId = (Long) session.getAttribute("userId");

        Job job = jobService.findById(id);

        if(result.hasErrors()) {
            model.addAttribute("job", job);
            model.addAttribute("tasks", taskService.jobTasks(id));
            return "tasks.jsp";
        }else {
            Task newTask = new Task(task.getName());
            newTask.setJob(job);
            newTask.setCreator(userService.findById(userId));
            taskService.addTask(newTask);
            return "redirect:/jobs/" + id + "/tasks";
        }

    }
}