package main

import (
	"fmt"
	"github.com/docopt/docopt-go"
	compute "github.com/go-compute/mean/pkg"
	"os"
)

const usage = `
Usage:
	mean <file>
	mean -h | --help

Options:
	-h, --help 	  	output help information

`

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	// Parse input arguments:
	args, err := docopt.Parse(usage, nil, true, ``, false)
	check(err)

	// Open the input file:
	path := args["<file>"].(string)
	file, err := os.Open(path)
	check(err)

	defer file.Close()

	// Read each line of the file and store in a data array...
	var (
		value float64
		n     int
		data  []float64
	)
	for {
		n, err = fmt.Fscanln(file, &value)
		if n == 0 || err != nil {
			break
		}
		data = append(data, value)
	}

	// Compute the mean:
	mu := compute.Mean(data)

	// Output to stdout:
	fmt.Println("Mean: ", mu)
}
