# -*- mode: ruby -*-

# NOTE: The `--no-wait` flag doesn't work in other tools like `gh`.
ENV["EDITOR"] = ENV["VISUAL"] = "emacsclient --no-wait"

c = IRB.conf
c[:COMPLETOR] = :type
c[:COMMAND_ALIASES].update(
  d: "show_doc",
  e: "edit",
  h: "help",
)
