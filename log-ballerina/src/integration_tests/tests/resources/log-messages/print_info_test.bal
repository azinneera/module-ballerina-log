// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/io;
import ballerina/log;

public function main() {
    log:Logger logger = log:logger();

    final Fruit apple = new ("Apple");

    logger.log(log:INFO, "INFO level log");
    logger.log(log:INFO, 123456);
    logger.log(log:INFO, 123456.789);
    logger.log(log:INFO, true);
    logger.log(log:INFO, isolated function() returns string {
        return io:sprintf("Name of the fruit is is %s", apple.getName());
        });
}

public readonly class Fruit {
    string name;
    public isolated function init(string name) {
        self.name = name;
    }
    isolated function getName() returns string {
        return self.name;
    }
}
