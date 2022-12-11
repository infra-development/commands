#!/bin/bash

#creates a new module in namespace example.com/hello, initializing the go.mod file that describes it.
go mod init example.com/hello

#package building command
go build

#run test cases
go test

#List all the modules
go list -m all

#Get the dependencies
go get rsc.io/quote/v3

#Get the dependencies with version number
go get rsc.io/sampler@v1.3.1

#List all the versions of particular dependencies
go list -m -versions rsc.io/sampler

#Remove unused dependencies
go mod tidy

#List all the dependencies starting with
go list -m rsc.io/q...

#Documentation fro specific dependencies
go doc rsc.io/quote/v3


