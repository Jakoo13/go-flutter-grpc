package main

import (
	"context"
	"log"
	"time"

	"github.com/Jakoo13/grpc-go-example/greet/proto"
)

func doLongGreet(c proto.GreetServiceClient) {
	log.Println("doLongGreet was invoked")

	reqs := []*proto.GreetRequest{
		{FirstName: "Jake"},
		{FirstName: "John"},
		{FirstName: "Jane"},
	}

	stream, err := c.LongGreet(context.Background())
	if err != nil {
		log.Fatalf("Failed to invoke LongGreet: %v\n", err)
	}

	for _, req := range reqs {
		log.Printf("Sending request: %v\n", req)
		stream.Send(req)
		time.Sleep(1 * time.Second)
	}

	res, err := stream.CloseAndRecv()
	if err != nil {
		log.Fatalf("Failed to receive response from LongGreet: %v\n", err)
	}

	log.Printf("LongGreet result: %s\n", res.Result)
}
