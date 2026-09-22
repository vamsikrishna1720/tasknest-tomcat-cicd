package com.tasknest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/add-task")
public class AddTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        if (title != null && !title.trim().isEmpty()) {
            TaskStore.add(title.trim(),
                    description == null ? "" : description.trim());
        }
        resp.sendRedirect(req.getContextPath() + "/");
    }
}
