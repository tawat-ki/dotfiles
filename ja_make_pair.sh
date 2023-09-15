#!/bin/bash
# This is a script that accepts an argument and uses it in commands.

# Check if argument was passed
if [ $# -eq 0 ]; then
    echo "No arguments supplied. Please supply one argument."
    exit 1
fi

# The argument
ARG=$1

# Command 1

echo "python -m jupyter_ascending.scripts.make_pair: $ARG"
~/python_venv/main/bin/python -m jupyter_ascending.scripts.make_pair --base $ARG 

# Command 2
echo "append init cell :  $ARG.sync.py"

cat <<EOF >> $ARG.sync.py
#set notebook style
from IPython.display import display, HTML

css = """
<style>
div.input_area {
    overflow: hidden !important; /* Hide the whole input area */
    line-height: 1em; /* Define a height for one line */
    max-height: 3.5em; /* Show only the first line */
}
</style>
"""
display(HTML(css))
# %% 
EOF

