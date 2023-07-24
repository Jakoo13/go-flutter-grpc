package main

import (
	"context"
	"io"
	"log"

	"github.com/Jakoo13/grpc-go-example/greet/proto"
)

func doGreet(c proto.GreetServiceClient) {
	log.Println("doGreet was invoked")
	res, err := c.Greet(context.Background(), &proto.GreetRequest{
		FirstName: "Jakub",
	})
	if err != nil {
		log.Fatalf("Failed to invoke Greet: %v\n", err)
	}

	log.Printf("Greet result: %s\n", res.Result)

}

func doGreetManyTimes(c proto.GreetServiceClient) {
	log.Println("doGreetManyTimes was invoked")
	resStream, err := c.GreetManyTimes(context.Background(), &proto.GreetRequest{
		FirstName: "Jakub",
	})
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