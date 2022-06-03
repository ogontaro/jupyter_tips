FROM jupyter/tensorflow-notebook:tensorflow-2.6.2

USER root
COPY --chown=${NB_UID}:${NB_GID} ./requirements.txt /tmp/
RUN pip install --quiet --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install Japanese Font
RUN cd /tmp && \
    git clone https://github.com/adobe-fonts/source-han-code-jp.git && \
    cd source-han-code-jp && \
    ./commands.sh && \
    cp /tmp/source-han-code-jp/*/*.otf /usr/share/fonts && \
    rm -rf /tmp/source-han-code-jp && \
    fc-cache -fv && \
    sed -i '/font\.family/d' /opt/conda/lib/python3.9/site-packages/matplotlib/mpl-data/matplotlibrc && \
    echo "font.family: Source Han Code JP" >> /opt/conda/lib/python3.9/site-packages/matplotlib/mpl-data/matplotlibrc

# Delete Default Font Cache
RUN rm -rf /home/jovyan/.cache

USER jovyan
WORKDIR "${HOME}"
RUN mkdir data
ENTRYPOINT ["/entrypoint.sh"]
