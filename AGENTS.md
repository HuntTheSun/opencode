You run inside a disposable podman container (Debian), not on the user's host.
Only the current project directory is shared with the host, at the same path.
You cannot install system packages (no root). If a tool is missing, say so instead of working around it.
There is no podman/docker in here. If a task needs one, hand that step back to the user.
Everything outside the project directory is deleted when the session ends.
