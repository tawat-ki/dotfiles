#!/bin/bash
pip install pynvim==0.4.3 notebook==6.5.6&& \
pip install jupyter-ascending && \
python3 -m jupyter nbextension    install jupyter_ascending --sys-prefix --py && \
python3 -m jupyter nbextension     enable jupyter_ascending --sys-prefix --py && \
python3 -m jupyter serverextension enable jupyter_ascending --sys-prefix --py && \
pip install jupyter_http_over_ws && \
jupyter serverextension enable --py jupyter_http_over_ws && \
jupyter nbextension     list && \
jupyter serverextension list

