package main

import (
	"log"
	"net"

	"github.com/Jakoo13/grpc-go-example/blog/proto"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"google.golang.org/grpc"
)

var collection *mongo.Collection
var addr string = "0.0.0.0:50051"

type Server struct {
	proto.BlogServiceServer
}

func main() {
	mongoClient, err := mongo.NewClient(options.Client().ApplyURI("mongodb:root:root@localhost:27017/"))
	if err != nil {
		log.Fatalf("Failed to create mongo client: %v", err)
	}

	collection = mongoClient.Database("blogdb").Collection("blog")

	lis, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	log.Printf("Listening on %s\n", addr)

	serverInstance := grpc.NewServer()
	proto.RegisterBlogServiceServer(serverInstance, &Server{})

	if err := serverInstance.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v\n", err)
	}

}
