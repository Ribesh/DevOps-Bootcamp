# Interactive vs non interactive shell

> Understanding the distinction between **interactive** and **non-interactive** shells is fundamental when writing reliable Bash scripts. 

>Interactive shells are designed for **on-the-fly command entry**, while non-interactive shells execute **prewritten scripts without user intervention**.


## Two Modes of Shell Operation
1. **Interactive Mode**
    - You type commands at a prompt and see immediate feedback.

2. **Non-Interactive Mode**
    - You place commands in a file (a script) and run them all at once.


### Interactive Example
```bash
$ ls
file1.txt  file2.txt

$ cd /tmp

$ pwd
/tmp
```

### Non-Interactive Shell Example
1. Create a script `script.sh`:
    ```bash
    #!/bin/bash
    ls
    cd /tmp
    pwd
    ```

2.  Make it executable and run:
    ```bash
    chmod +x script.sh
    ./script.sh
    
    # Output:
    # file1.txt  file2.txt
    # /tmp
    ```

![alt text](image.png)

### Why It Matters
Some environment variables and shell behaviors differ between modes:

1. Interactive mode:
```bash
$ echo "$PS1"

#Output:
\u@\h:\w\$
```

2. Non-interactive script (show_ps1.sh):
```bash
#!/bin/bash
echo "$PS1"
```
> Running it produces no output because PS1 is unset in non-interactive shells.




## Best Practices for Shell Scripts
1. Start with a shebang `#!/usr/bin/env bash` for portability.
2. Use `set -euo pipefail` to catch errors early.
3. Double-quote variable expansions to prevent word splitting: `"$VAR"`.
4. Explicitly source files when needed:
`source ~/.bashrc`
5. Test scripts in both modes if they must run interactively and non-interactively.
 