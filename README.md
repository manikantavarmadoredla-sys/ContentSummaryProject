# Choices Summary

A small JSP web application with an introduction, a summary form, server-side
name and email verification, and a results page.

## Run

Use Java 11 or newer, Maven, and a Jakarta EE 10-compatible servlet container
(for example, Apache Tomcat 10.1):

1. Build the WAR: `mvn clean package`
2. Deploy `target/choices-summary.war` to the servlet container.
3. Open `http://localhost:8080/choices-summary/about.html`.

The form accepts a name that starts with an uppercase letter and has fewer than
10 characters, and the email address `abc@gmail.com`. A summary is required.
The JSP validates the submission and stores verified values in the user's
session; `display.html` retrieves them from `display-data.jsp`.

## Git practice

Run these commands in the project directory. Replace the example name and email
with the identity you want recorded in this repository:

```powershell
git init
git config user.name "Your Name"
git config user.email "you@example.com"
git status --short
git add .
git status --short
git commit -m "Create choices summary project"

# Make a small edit to README.md, then inspect the unstaged change.
git diff
git add README.md
git diff --cached
git restore --staged README.md
git status --short
git add README.md
git commit -m "Document project setup"
git log --oneline
git log -n 2 --pretty=format:"%h | %an <%ae> | %s%n"
```

`git status --short` shows untracked files with `??` before the first add,
staged files with `A`, and modified files with `M`. `git restore --staged`
removes a file from the staging area without discarding its edits.
