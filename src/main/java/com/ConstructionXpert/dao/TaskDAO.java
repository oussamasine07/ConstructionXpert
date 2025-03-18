package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Task;

import java.util.ArrayList;
import java.util.List;

public class TaskDAO extends ConnectToDb {

    public TaskDAO () {}

    public List<Task> listAllTasks (int projectId) {
        List<Task> tasks = new ArrayList<>();

        return tasks;
    }

}
