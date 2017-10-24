#cloud-config

salt_minion:
  # conf contains all the directives to be assigned in /etc/salt/minion.

  conf:
  # Set the location of the salt master server, if the master server cannot be
  # resolved, then the minion will fail to start.

  master: 8.8.8.8
