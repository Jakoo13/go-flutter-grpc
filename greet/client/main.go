package main

import (
	"log"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	pb "github.com/Jakoo13/grpc-go-example/greet/proto"
)

var addr string = "localhost:50051"

func main() {
	conn, err := grpc.Dial(addr, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Failed to dial: %v\n", err)
	}
	defer conn.Close()

	client := pb.NewGreetServiceClient(conn)

	doGreet(client)

	doGreetManyTimes(client)
	doLongGreet(client)
	doGreetEveryone(client)

}
