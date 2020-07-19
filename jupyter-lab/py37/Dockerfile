FROM python:3.7.8-buster

RUN pip3 install --no-cache-dir \
    jupyterlab \
    pandas \
    matplotlib \
    numpy

RUN mkdir -p /opt/jupyter

WORKDIR /opt/jupyter
COPY requirements.txt /opt/jupyter/requirements.txt
RUN pip3 install -r requirements.txt
   
EXPOSE 8888
CMD ["jupyter", "lab",  "--ip=0.0.0.0", "--port=8888", "--no-browser", "--notebook-dir=/opt/jupyter", "--allow-root"]

