FROM nvidia/cuda-ppc64le:8.0-cudnn6-devel-ubuntu16.04
LABEL maintainer="Jayachandran B (ANZ Engineering)"

# Install Python 3.5 (and somemore) and make it the default
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
          python3 \
          python3-dev \
          python3-pip \
          python3-wheel \
          python3-numpy \
          python3-scipy \
          python3-setuptools \
          pkg-config \
          libfreetype6-dev \
          libpng12-dev \
          libjpeg-dev \
          libpng-dev\
          wget && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /usr/bin/python && \
    rm -f /usr/bin/pydoc && \
    rm -f /usr/bin/pygettext && \
    rm -f /usr/bin/python-config && \
    ln -s /usr/bin/python3.5 /usr/bin/python && \
    ln -s /usr/bin/pydoc3.5 /usr/bin/pydoc && \
    ln -s /usr/bin/pygettext3.5 /usr/bin/pygettext && \
    ln -s /usr/bin/python3.5-config /usr/bin/python-config

# Install ML/DL/Stat libraries and jupyter
RUN cd /tmp && \
    wget https://raw.githubusercontent.com/jayachandranb/tensorflow-py35-ppc64le/master/tensorflow-1.4.0-cp35-cp35m-linux_ppc64le.whl && \
    wget https://raw.githubusercontent.com/jayachandranb/tensorflow-py35-ppc64le/master/tensorflow_tensorboard-0.4.0rc3-py3-none-any.whl && \
    pip3 install --no-cache-dir \
          --upgrade pip && \
    pip3 install --no-cache-dir \
          bokeh \
          cloudpickle \
          cython \
          dill \
          h2o \
          ipykernel \
          ipython \
          ipython-genutils \
          ipywidgets \
          jupyter \
          jupyter-client \
          jupyter-console \
          jupyter-core \
          jupyterlab \
          jupyterlab_launcher \
          matplotlib \
          nbconvert \
          nbformat \
          nose \
          notebook \
          panda \
          pandas \
          parameterized \
          plotly \
          pydot-ng \
          pyspark \
          scikit-image \
          scikit-learn \
          seaborn \
          sphinx \
          statsmodels \
          sympy \
          theano \
          /tmp/tensorflow_tensorboard-0.4.0rc3-py3-none-any.whl \
          /tmp/tensorflow-1.4.0-cp35-cp35m-linux_ppc64le.whl \
          virtualenv \
          vincent \
          webencodings \
          widgetsnbextension \
          xlrd && \
    pip3 install --no-cache-dir \
         --upgrade bleach && \
    rm -f /tmp/*

# Patch tensorflow_tensorboard
COPY __main__.py /usr/local/lib/python3.5/dist-packages/tensorboard/

# Setup jupyter
RUN python3 -m ipykernel.kernelspec && \
    jupyter serverextension enable --py jupyterlab && \
    mkdir -p /root/pod_storage/notebooks && \
    mkdir -p /root/pod_storage/tf_logs && \
    mkdir -p /root/local_storage

COPY jupyter_notebook_config.py /root/.jupyter/

# Initialise
ENV TB_LOG_DIR "/root/pod_storage/tf_logs"
ENV UI_MODE "lab"
COPY start.sh /
RUN chmod +x /start.sh

WORKDIR /root/pod_storage/notebooks

EXPOSE 7777 8888
CMD ["/start.sh"]
