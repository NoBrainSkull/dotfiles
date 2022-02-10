#!/bin/bash
# $1_msg
interrupt_on_failure() {
  eval $1;
  if [ $? = 1 ]; then
    echo "[FATAL] - $1 command failed"
    return;
  fi
}

mix deps.get
interrupt_on_failure 'mix ecto.reset'
interrupt_on_failure 'mix compile --force'
interrupt_on_failure 'mix test'
mix credo -a