package main

import (
	"context"
	"log"
	"net"

	"github.com/Jakoo13/grpc-go-example/blog/proto"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"google.golang.org/grpc"
)

var collection *mongo.Collection
var addr string = "0.0.0.0:50051"

const uri = "mongodb://root:root@localhost:27017/"

type Server struct {
	proto.BlogServiceServer
}

func main() {
	// Deprecated 
	// mongoClient, err := mongo.NewClient(options.Client().ApplyURI("mongodb:root:root@localhost:27017/"))
	serverAPI := options.ServerAPI(options.ServerAPIVersion1)
	opts := options.Client().ApplyURI(uri).SetServerAPIOptions(serverAPI)
	// Create a new client and connect to the server
	mongoClient, err := mongo.Connect(context.TODO(), opts)
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
