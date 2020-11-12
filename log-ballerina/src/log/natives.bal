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

# Logs the specified value at DEBUG level.
# ```ballerina
# log:printDebug("debug log");
# ```
#
# + msg - The message to be logged
public isolated function printDebug(anydata|(isolated function () returns (anydata)) msg) {
    if (isLogLevelEnabled(DEBUG)) {
        if (msg is isolated function () returns (anydata)) {
            logMessage(DEBUG, msg());
        } else {
            logMessage(DEBUG, msg);
        }
    }
}

# Logs the specified message at ERROR level.
# ```ballerina
# error e = error("error occurred");
# log:printError("error log with cause", err = e);
# ```
#
# + msg - The message to be logged
# + err - The error struct to be logged
public isolated function printError(anydata|(isolated function () returns (anydata)) msg, error? err = ()) {
    if (isLogLevelEnabled(ERROR)) {
        if (msg is isolated function () returns (anydata)) {
            logMessageWithError(ERROR, msg(), err);
        } else {
            logMessageWithError(ERROR, msg, err);
        }
    }
}

# Logs the specified message at INFO level.
# ```ballerina
# log:printInfo("info log");
# ```
#
# + msg - The message to be logged
public isolated function printInfo(anydata|(isolated function () returns (anydata)) msg) {
    if (isLogLevelEnabled(INFO)) {
        if (msg is isolated function () returns (anydata)) {
            logMessage(INFO, msg());
        } else {
            logMessage(INFO, msg);
        }
    }
}

# Logs the specified message at TRACE level.
# ```ballerina
# log:printTrace("trace log");
# ```
#
# + msg - The message to be logged
public isolated function printTrace(anydata|(isolated function () returns (anydata)) msg) {
    if (isLogLevelEnabled(TRACE)) {
        if (msg is isolated function () returns (anydata)) {
            logMessage(TRACE, msg());
        } else {
            logMessage(TRACE, msg);
        }
    }
}

# Logs the specified message at WARN level.
# ```ballerina
# log:printWarn("warn log");
# ```
#
# + msg - The message to be logged
public isolated function printWarn(anydata|(isolated function () returns (anydata)) msg) {
    if (isLogLevelEnabled(WARN)) {
        if (msg is isolated function () returns (anydata)) {
            logMessage(WARN, msg());
        } else {
            logMessage(WARN, msg);
        }
    }
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

isolated function isLogLevelEnabled(LogLevel logLevel) returns boolean = @java:Method {
    'class: "org.ballerinalang.stdlib.log.Utils"
} external;

isolated function logMessage(LogLevel logLevel, anydata msg) = @java:Method {
    'class: "org.ballerinalang.stdlib.log.Utils"
} external;

isolated function logMessageWithError(LogLevel logLevel, anydata msg, error? err = ()) = @java:Method {
    'class: "org.ballerinalang.stdlib.log.Utils"
} external;
