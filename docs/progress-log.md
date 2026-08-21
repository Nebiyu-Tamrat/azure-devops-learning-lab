# DevOps Engineering Progress Log

This log records the practical implementations I complete in this repository, including the decisions I make, the commands I use, the problems I encounter, and how I resolve them.

## Milestone 1: Repository Foundation and Git Configuration

**Date:** 21 August 2026  
**Related issue:** #1  
**Status:** In progress

### Objective

My objective for this milestone was to establish a clean Git repository with a professional structure, secure configuration, Linux-compatible line endings, and a traceable connection between my local repository and GitHub.

### Work Completed

- Created a dedicated GitHub repository for my DevOps engineering portfolio.
- Created and initialised the corresponding local Git repository.
- Configured my Git author name and GitHub no-reply email.
- Set `main` as the default branch.
- Configured Git to preserve Linux-compatible line endings.
- Connected the local repository to GitHub through HTTPS.
- Created the initial `README.md`, `.gitignore`, and `.gitattributes` files.
- Validated and committed the repository foundation.
- Pushed the initial `main` branch to GitHub.
- Created GitHub issue #1 to define the progress-log requirements.
- Created a dedicated documentation branch for the issue.

### Important Commands

| Command | Purpose |
|---|---|
| `git config --global user.name "Nebiyu Tamrat"` | Configured the author name attached to my commits. |
| `git config --global user.email "<GitHub no-reply email>"` | Connected my commits to GitHub without exposing my personal email address. |
| `git config --global init.defaultBranch main` | Set `main` as the default branch for new repositories. |
| `git config --global core.autocrlf input` | Configured Git to commit Linux-compatible LF line endings. |
| `git init` | Initialised the local directory as a Git repository. |
| `git remote add origin <repository URL>` | Connected the local repository to the GitHub repository. |
| `git remote -v` | Verified the configured fetch and push URLs. |
| `git status` | Inspected the current branch and file states. |
| `git add README.md .gitignore .gitattributes` | Added the foundation files to the staging area. |
| `git diff --cached --check` | Checked staged content for whitespace errors before committing. |
| `git diff --cached --stat` | Reviewed a summary of the staged changes. |
| `git commit -m "docs: establish repository foundation"` | Created the first local repository snapshot. |
| `git push -u origin main` | Published `main` and configured its upstream branch. |
| `git pull --ff-only origin main` | Synchronised local `main` without allowing an unexpected merge commit. |
| `git switch -c docs/issue-1-progress-log` | Created and switched to the documentation branch for issue #1. |

### Problems Encountered and Resolutions

#### Multiple commands entered as one Git command

I initially entered several `git config` operations on the same line without separating them. Git interpreted the remaining text as additional arguments and returned:

```text
error: no action specified
```

I resolved this by entering each Git command separately.

#### Missing configuration key

I initially supplied the email value without correctly including the `user.email` configuration key. Git returned an error indicating that the key did not contain a section.

I corrected the syntax:

```bash
git config --global user.email "<GitHub no-reply email>"
```

#### Insecure remote URL

The first remote URL used `http://`. Although the repository address was correct, HTTP does not provide the encrypted connection required for secure authentication and data transfer.

I corrected it with:

```bash
git remote set-url origin https://github.com/Nebiyu-Tamrat/azure-devops-learning-lab.git
```

I then confirmed both remote operations with:

```bash
git remote -v
```

#### Incorrect filename while staging

I initially entered `.gitignore.` with an unnecessary final period. Git could not find a file with that exact name and returned a `pathspec` error.

I corrected the filename and staged the intended files:

```bash
git add README.md .gitignore .gitattributes
```

#### Line-ending warning

While staging files, Git reported that CRLF line endings would be replaced with LF. This was expected because I configured the repository for Linux-compatible line endings using `.gitattributes`.

The warning confirmed that Git would normalise the files when storing them.

### Validation

I validated the milestone using:

```bash
git status
git diff --cached --check
git diff --cached --stat
git log --oneline
git remote -v
```

The repository finished with:

- A clean `main` branch.
- One documented foundation commit.
- An HTTPS remote connection.
- Linux-compatible line-ending rules.
- Sensitive and generated files excluded through `.gitignore`.
- A dedicated branch for issue #1.

### Key Lessons

- Git commands must be entered separately unless a shell operator intentionally connects them.
- Git configuration keys require their complete section and variable names.
- I should inspect remote URLs before pushing.
- Exact filenames matter when staging changes.
- The staging area gives me an opportunity to inspect and validate changes before committing.
- Line-ending management is important when developing on Windows for Linux-based systems.
- Issues, branches, commits, and pull requests provide traceability between requirements and implementation.