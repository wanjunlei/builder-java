# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG from_image
FROM ${from_image}

ARG java_agent_version=8.14.0

ADD https://dlcdn.apache.org/skywalking/java-agent/${java_agent_version}/apache-skywalking-java-agent-${java_agent_version}.tgz /

RUN tar xzf apache-skywalking-java-agent-${java_agent_version}.tgz -C /usr/local/ && \
  rm -rf apache-skywalking-java-agent-${java_agent_version}.tgz && \
  chown -R ${cnb_uid}:${cnb_gid} /usr/local/skywalking-agent

ENV PORT 8080
USER cnb

