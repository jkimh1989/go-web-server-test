package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// Get the pod's IP address and node name from environment variables
		podIP := os.Getenv("POD_IP")
		nodeName := os.Getenv("NODE_NAME")

		// Display the information
		w.Header().Set("Content-Type", "text/plain")
		fmt.Fprintf(w, "Hello from the pod!\n")
		fmt.Fprintf(w, "Pod IP: %s\n", podIP)
		fmt.Fprintf(w, "Node Name: %s\n", nodeName)
	})

	// Start the server on port 8080
	port := "8080"
	fmt.Printf("Server is running on port %s\n", port)
	http.ListenAndServe(":"+port, nil)
}
