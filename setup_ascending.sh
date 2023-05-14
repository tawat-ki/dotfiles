pip install pynvim notebook && \
pip install jupyter_ascending && \
python -m jupyter nbextension    install jupyter_ascending --sys-prefix --py && \
python -m jupyter nbextension     enable jupyter_ascending --sys-prefix --py && \
python -m jupyter serverextension enable jupyter_ascending --sys-prefix --py && \
pip install jupyter_http_over_ws && \
jupyter serverextension enable --py jupyter_http_over_ws && \
jupyter nbextension     list && \
jupyter serverextension list

