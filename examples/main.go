/*
Example program which computes the arithmetic mean of a numeric array.
*/
package main

import (
	"fmt"
	compute "github.com/go-compute/mean/pkg"
	"math/rand"
)

/*
Demonstrates how to use the package to compute the arithmetic mean of a numeric array.
*/
func main() {
	data := make([]float64, 101)
	for i := 0; i < len(data); i++ {
		data[i] = rand.Float64() * 100
	}
	mu := compute.Mean(data)
	fmt.Println("Mean: ", mu)
}
