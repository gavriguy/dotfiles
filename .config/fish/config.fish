# pnpm
set -gx PNPM_HOME "/Users/gabrielguy/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source ~/.asdf/asdf.fish


zoxide init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gabrielguy/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/gabrielguy/Downloads/google-cloud-sdk/path.fish.inc'; end
