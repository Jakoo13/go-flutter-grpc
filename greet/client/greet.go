package main

import (
	"context"
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