# Ruby Tracker

## Generate gRPC stubs

```shell 
grpc_tools_ruby_protoc --proto_path=proto --grpc_out=stubs --ruby_out=stubs proto/*
```