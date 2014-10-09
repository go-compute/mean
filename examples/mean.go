// Example program which computes the arithmetic mean of a numeric array.
package main

import (
	"fmt"
	compute "github.com/go-compute/mean/lib"
)

// Example which computes the arithmetic mean of a numeric array.
func main() {
	var data = make([]float64, 101)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	mu := compute.Mean(data)
	fmt.Println("Mean: ", mu)
}
