package main

import (
	"context"
	"fmt"
	"log"

	"github.com/Jakoo13/grpc-go-example/blog/proto"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *Server) ListBlogs(in *emptypb.Empty, stream proto.BlogService_ListBlogsServer) error {
	log.Println("Received ListBlogs request")

	cursor, err := collection.Find(context.Background(), primitive.D{{}})
	if err != nil {
		return status.Errorf(
			codes.Internal,
			fmt.Sprintf("Internal error: %s", err),
		)
	}
	// defer cursor.Close(context.Background())

	for cursor.Next(context.Background()) {
		data := &BlogItem{}
		err := cursor.Decode(data)
		if err != nil {
			return status.Errorf(
				codes.Internal,
				fmt.Sprintf("Error while decoding data from MongoDB: %s", err),
			)
		}

		stream.Send(documentToBlog(data))
	}

	if err = cursor.Err(); err != nil {
		return status.Errorf(
			codes.Internal,
			fmt.Sprintf("Unknown Internal Errorrr: %s", err),
		)
	}

	return nil
}
