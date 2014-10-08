package main

import (
	"fmt"
	compute "github.com/go-compute/mean/lib"
)

func main() {
	var data []float64 = make( []float64, 101 )
	for i := 0; i < len( data ); i++ {
		data[ i ] = float64( i )
	}
	mu := compute.Mean( data )
	fmt.Println( "Mean: ", mu )
}