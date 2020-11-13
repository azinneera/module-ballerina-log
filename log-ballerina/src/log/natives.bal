// Copyright (c) 2017 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/java;

# Represents log level types.
public enum LogLevel {
    DEBUG,
    ERROR,
    INFO,
    TRACE,
    WARN,
    ALL,
    OFF
}

# Sets the module log level. If a module name is not specified, the log level will be set to the current module.
# Following log levels are allowed.
#
# ERROR - error log level
#
# WARN - warn log level
#
# INFO - info log level
#
# DEBUG - debug log level
#
# TRACE - trace log level
#
# OFF - turns off logging
#
# ALL - enables all the log levels
#
# ```ballerina
# log:setModuleLevelLog(log:DEBUG, moduleName=“alpha”);
# log:setModuleLevelLog(log:WARN);
# ```
#
# + logLevel - Log level to be set
# + moduleName - Name of the module
public isolated function setModuleLogLevel(LogLevel logLevel, string? moduleName = ()) = @java:Method {
    'class: "org.ballerinalang.stdlib.log.Utils"
} external;
