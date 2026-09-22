package com.tasknest;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class TaskStore {
    private static final List<Task> tasks = new ArrayList<>();
    private static final AtomicInteger sequence = new AtomicInteger(4);

    static {
        tasks.add(new Task(1, "Learn AWS", "Revise EC2 and S3", false));
        tasks.add(new Task(2, "Practice Linux", "Practice basic Linux commands", true));
        tasks.add(new Task(3, "Build CI/CD", "Deploy TaskNest using Jenkins and Tomcat", false));
    }

    public static synchronized List<Task> all() {
        return new ArrayList<>(tasks);
    }

    public static synchronized void add(String title, String description) {
        tasks.add(new Task(sequence.getAndIncrement(), title, description, false));
    }

    public static synchronized void toggle(int id) {
        for (int i = 0; i < tasks.size(); i++) {
            Task t = tasks.get(i);
            if (t.getId() == id) {
                tasks.set(i, new Task(t.getId(), t.getTitle(), t.getDescription(), !t.isCompleted()));
                return;
            }
        }
    }

    public static synchronized void delete(int id) {
        tasks.removeIf(t -> t.getId() == id);
    }
}
