package main

import (
	"fmt"
	"log"
	"time"

	"github.com/Jakoo13/grpc-go-example/greet/proto"
)

func (s *Server) GreetManyTimes(in *proto.GreetRequest, stream proto.GreetService_GreetManyTimesServer) error {
	log.Printf("GreetManyTimes function was invoked %v\n", in)

	for i := 0; i < 10; i++ {
		result := fmt.Sprintf("Hello %s, number %d", in.FirstName, i)
		res := &proto.GreetResponse{
			Result: result,
		}
		stream.Send(res)
		time.Sleep(2 * time.Second)
	}

	return nil
}
