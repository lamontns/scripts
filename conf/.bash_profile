test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nick/Testing/google-cloud-sdk/path.bash.inc' ]; then source '/Users/nick/Testing/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nick/Testing/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/nick/Testing/google-cloud-sdk/completion.bash.inc'; fi

alias plabs='gcloud compute --project "skillful-coast-168223" ssh --zone "us-east4-c" "pentesterlabs"'
