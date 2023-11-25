# pip uninstall -y traitlets 
# pip install traitlets==5.9.0
pip install pynvim==0.4.3 notebook==6.5.6&& \
pip install jupyter-ascending==0.1.25 && \
python -m jupyter nbextension    install jupyter_ascending --sys-prefix --py && \
python -m jupyter nbextension     enable jupyter_ascending --sys-prefix --py && \
python -m jupyter serverextension enable jupyter_ascending --sys-prefix --py && \
pip install jupyter_http_over_ws && \
jupyter serverextension enable --py jupyter_http_over_ws && \
jupyter nbextension     list && \
jupyter serverextension list

