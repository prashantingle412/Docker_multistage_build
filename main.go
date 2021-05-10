package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/google/uuid"
)

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("api is called to add")
	uuid := uuid.New()
	fmt.Fprintf(w, "http2 server api is called %s is", uuid)

}

func main() {
	fmt.Println("server started on 9091")
	http.HandleFunc("/add", rootHandler)
	log.Fatal(http.ListenAndServe(":9091", nil))
}
