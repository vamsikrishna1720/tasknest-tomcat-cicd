# TaskNest - Tomcat CI/CD Edition

A simple Java Servlet/JSP task manager designed for practicing:

- GitHub
- Maven
- Jenkins CI/CD
- WAR packaging
- Apache Tomcat
- AWS EC2

## Requirements

- JDK 11+
- Maven 3.8+
- Apache Tomcat 9
- Git

## Run locally

```bash
mvn clean package
```

The WAR will be created at:

```text
target/tasknest.war
```

Copy `target/tasknest.war` into Tomcat's `webapps` directory and start Tomcat.

Open:

```text
http://localhost:8080/tasknest/
```

## CI/CD idea

```text
GitHub -> Jenkins -> Maven build -> tasknest.war -> Tomcat on EC2
```

This project intentionally uses in-memory task storage so the first CI/CD deployment has no database setup. A MySQL version can be added later.
