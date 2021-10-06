FROM ibmcom/ace-server:11.0.0.11-r2-20210303-133203-amd64

ENV LICENSE "accept"

# Copy the jms jar files to ace-server common classes directory
#COPY jars/* /opt/ibm/ace-11/common/classes/

USER root
COPY bar_files /home/aceuser/bars
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000
RUN ace_compile_bars.sh
USER root
RUN  chmod -R ugo+rwx /home/aceuser
USER 1000