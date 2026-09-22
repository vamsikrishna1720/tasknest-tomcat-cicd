package com.tasknest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            if ("toggle".equals(action)) TaskStore.toggle(id);
            if ("delete".equals(action)) TaskStore.delete(id);
        } catch (Exception ignored) {
            // Ignore malformed action requests.
        }
        resp.sendRedirect(req.getContextPath() + "/");
    }
}
