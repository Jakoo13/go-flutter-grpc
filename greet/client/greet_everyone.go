package main

import (
	"context"
	"io"
	"log"
	"time"

	"github.com/Jakoo13/grpc-go-example/greet/proto"
)

func doGreetEveryone(c proto.GreetServiceClient) {
	log.Println("doGreetEveryone was invoked")

	stream, err := c.GreetEveryone(context.Background())
	if err != nil {
		log.Fatalf("Failed to invoke GreetEveryone: %v\n", err)
	}

	reqs := []*proto.GreetRequest{
		{FirstName: "Jake"},
		{FirstName: "John"},
		{FirstName: "Jane"},
	}

	waitc := make(chan struct{})

	go func() {
		for _, req := range reqs {
			log.Printf("Sending request: %v\n", req)
			stream.Send(req)
			time.Sleep(1 * time.Second)
		}
		stream.CloseSend()
	}()

	go func() {
		for {
			res, err := stream.Recv()
			if err == io.EOF {
				break
			}
			if err != nil {
				log.Fatalf("Error while receiving: %v\n", err)
				break
			}
			log.Printf("GreetEveryone result: %s\n", res.Result)
		}
		close(waitc)
	}()

	<-waitc

}
