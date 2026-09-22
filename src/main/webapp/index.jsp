<%@ page import="java.util.List" %>
<%@ page import="com.tasknest.Task" %>
<%@ page import="com.tasknest.TaskStore" %>
<%
    List<Task> tasks = TaskStore.all();
    int completed = 0;
    for (Task t : tasks) if (t.isCompleted()) completed++;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TaskNest | Task Manager</title>
<link rel="stylesheet" href="assets/style.css">
</head>
<body>
<header class="topbar">
  <div class="brand"><span>TN</span> TaskNest</div>
  <div class="tagline">Simple tasks. Better progress.</div>
</header>

<main class="container">
  <section class="hero">
    <div>
      <p class="eyebrow">TASK MANAGEMENT</p>
      <h1>Welcome to TaskNest</h1>
      <p>Organize your work, track your progress, and finish what matters.</p>
    </div>
    <div class="stats">
      <div><strong><%= tasks.size() %></strong><small>Total</small></div>
      <div><strong><%= completed %></strong><small>Completed</small></div>
      <div><strong><%= tasks.size() - completed %></strong><small>Pending</small></div>
    </div>
  </section>

  <section class="grid">
    <div class="card form-card">
      <h2>Add New Task</h2>
      <form method="post" action="add-task">
        <label>Task title</label>
        <input name="title" required placeholder="e.g. Learn Jenkins">
        <label>Description</label>
        <textarea name="description" rows="4" placeholder="Add a short description"></textarea>
        <button type="submit">+ Add Task</button>
      </form>
    </div>

    <div class="card">
      <div class="section-head">
        <h2>My Tasks</h2>
        <span class="count"><%= tasks.size() %></span>
      </div>
      <% if (tasks.isEmpty()) { %>
        <div class="empty">No tasks yet. Add your first task.</div>
      <% } %>
      <% for (Task task : tasks) { %>
        <article class="task <%= task.isCompleted() ? "done" : "" %>">
          <div class="task-main">
            <h3><%= task.getTitle() %></h3>
            <p><%= task.getDescription() %></p>
          </div>
          <div class="actions">
            <form method="post" action="tasks">
              <input type="hidden" name="id" value="<%= task.getId() %>">
              <input type="hidden" name="action" value="toggle">
              <button class="small" type="submit"><%= task.isCompleted() ? "Undo" : "Done" %></button>
            </form>
            <form method="post" action="tasks">
              <input type="hidden" name="id" value="<%= task.getId() %>">
              <input type="hidden" name="action" value="delete">
              <button class="small danger" type="submit">Delete</button>
            </form>
          </div>
        </article>
      <% } %>
    </div>
  </section>
</main>

<footer>TaskNest • Java + Maven + Tomcat CI/CD Practice Project</footer>
</body>
</html>
