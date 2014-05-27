# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/cerberus-back"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/cerberus-back/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/cerberus-back/log/unicorn.log"
stdout_path "/var/www/cerberus-back/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.cerberus-back.sock"

# Number of processes
# worker_processes 4
worker_processes 5

# Time-out
timeout 30