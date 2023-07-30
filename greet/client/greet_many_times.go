package main

import (
	"context"
	"io"
	"log"

	"github.com/Jakoo13/grpc-go-example/greet/proto"
)

func doGreetManyTimes(c proto.GreetServiceClient) {
	log.Println("doGreetManyTimes was invoked")
	
	req := &proto.GreetRequest{
		FirstName: "Jakub",
	}

	resStream, err := c.GreetManyTimes(context.Background(),req)
	if err != nil {
		log.Fatalf("Failed to invoke GreetManyTimes: %v\n", err)
	}

	for {
		msg, err := resStream.Recv()

		if err == io.EOF {
			// we've reached the end of the stream
			break
		}
		if err != nil {
			log.Fatalf("Failed to receive a response from GreetManyTimes: %v\n", err)
		}

		log.Printf("GreetManyTimes result: %s\n", msg.Result)
	}
}
