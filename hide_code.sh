#!/bin/bash
echo 1 - $1 -- 2 - $2
cat << 'EOF' >> $1
from IPython.display import display, HTML

css = """
<style>
div.input {
    display: none;
}
</style>
"""

display(HTML(css))
# %%
EOF
echo done
