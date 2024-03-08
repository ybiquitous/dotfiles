# -*- mode: ruby -*-
c = IRB.conf
c[:COMPLETOR] = :type
c[:COMMAND_ALIASES].update(
  d: "show_doc",
  e: "edit",
  h: "help",
)
