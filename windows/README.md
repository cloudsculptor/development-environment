# Setting up a Windows devlopment environment

1. Install Cmder terminal - https://cmder.net/
2. Set the default terminal to Bash - https://gist.github.com/nickautomatic/02ccb76292f7f8d9767e
3. Set Cmder to open as admin in Windows.
4. Copy `./shard/.bashrc` to admin home directory.
5. Copy `./shard/.bash_aliases` to regular user home directory.

    git clone git@github.com:cloudsculptor/development-environment.git
    cd development-environment
    cp shared/.bashrc ~/
    

## Tips

* `dos2unix` to fix line endings (all files recursive: `find . -type f -print0 | xargs -0 dos2unix`)
* `git config core.eol lf` + `git config core.autocrlf input`

Checkout Windows-style, commit Unix-style

Git will convert LF to CRLF when checking out text files. When committing text files, CRLF will be converted to LF. For cross-platform projects, this is the recommended setting on Windows ("core.autocrlf" is set to "true")

Checkout as-is, commit Unix-style

Git will not perform any conversion when checking out text files. When committing text files, CRLF will be converted to LF. For cross-platform projects this is the recommended setting on Unix ("core.autocrlf" is set to "input").

Checkout as-is, commit as-is

Git will not perform any conversions when checking out or committing text files. Choosing this option is not recommended for cross-platform projects ("core.autocrlf" is set to "false")


