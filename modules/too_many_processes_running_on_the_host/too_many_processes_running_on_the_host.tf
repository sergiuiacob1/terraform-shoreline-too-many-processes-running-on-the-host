resource "shoreline_notebook" "too_many_processes_running_on_the_host" {
  name       = "too_many_processes_running_on_the_host"
  data       = file("${path.module}/data/too_many_processes_running_on_the_host.json")
  depends_on = [shoreline_action.invoke_kill_processes]
}

resource "shoreline_file" "kill_processes" {
  name             = "kill_processes"
  input_file       = "${path.module}/data/kill_processes.sh"
  md5              = filemd5("${path.module}/data/kill_processes.sh")
  description      = "Killing process that match a certain regex pattern"
  destination_path = "/agent/scripts/kill_processes.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_kill_processes" {
  name        = "invoke_kill_processes"
  description = "Killing process that match a certain regex pattern"
  command     = "`/agent/scripts/kill_processes.sh`"
  params      = ["REGEX_PATTERN"]
  file_deps   = ["kill_processes"]
  enabled     = true
  depends_on  = [shoreline_file.kill_processes]
}

