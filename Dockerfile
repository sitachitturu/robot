FROM gliderlabs/alpine
MAINTAINER "Abdur Rahman" <abdurrahman.abdullahalbasir@ge.com>

LABEL name="Docker image for the Robot Framework http://robotframework.org/"
LABEL usage="docker run --rm -v /path/to/tests/:/path/to/tests/ -ti robot-docker robot --variable HOST:example.com --outputdir results /path/to/tests/"

#ARG http_proxy=http://10.114.19.193:80
ARG http_proxy
ARG no_proxy=127.0.0.1,localhost,localaddress,.localdomain.com,github.build.ge.com,openge.ge.com,ice.ge.com,*.devcloud.ge.com,registry.gear.ge.com

ENV HTTP_PROXY=$http_proxy
ENV http_proxy=$http_proxy
ENV HTTPS_PROXY=$http_proxy
ENV https_proxy=$http_proxy
ENV NO_PROXY=$no_proxy
ENV no_proxy=$no_proxy

RUN echo $HTTP_PROXY $http_proxy $HTTPS_PROXY $https_proxy $NO_PROXY $no_proxy

# Install Python Pip and the Robot framework
RUN apk-install bash py-pip xvfb dbus chromium-chromedriver && \
    pip install --upgrade pip && \
    pip install robotframework robotframework-selenium2library selenium robotframework-xvfb && \
    python --version

CMD "Xvfb ${DISPLAY:-:99} -ac -screen 0 ${RESOLUTION:-1920x1080x24} +extension RANDR"; \
	"export DISPLAY=${DISPLAY:-:99}"; \
	"pybot --loglevel ${LOG_LEVEL:-INFO} $ROBOT_TESTS"
