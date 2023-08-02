
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# Too many processes running on the host
---

If there are too many processes running on hosts, it could lead to performance issues and resource constraints. You may want to review and prioritize the running processes, terminating unnecessary ones, or optimizing resource allocation to improve system performance. Monitoring tools can help identify resource-intensive processes and their impact on the system.

### Parameters
```shell
export REGEX_PATTERN="PLACEHOLDER"
```

## Debug

### The maximum number of processes the user can create.
```shell
ulimit -u
```

### Check the amount of used memory by each process
```shell
ps aux --sort=-%mem | head
```

### Count the number of process running on the host
```shell
ps -e | wc -l
```

### Check for fork bombs
```shell
pstree -p
```

### Killing process that match a certain regex pattern
```shell
#!/bin/bash



# Use pkill with the -f option to match against the full command line

pkill -f ${REGEX_PATTERN}



# Check if any matching processes were terminated

if [ $? -eq 0 ]; then

  echo "Processes matching pattern '$regex_pattern' were terminated."

else

  echo "No processes found matching the pattern '$regex_pattern'."

fi
```