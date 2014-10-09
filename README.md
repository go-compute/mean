Mean
====
[![Build Status][travis-image]][travis-url] [![Coverage Status][coveralls-image]][coveralls-url]

> Computes the arithmetic mean of a numeric array.


## Installation

``` bash
$ go get "github.com/go-compute/mean/lib"
```

## Usage

To use the package,

``` golang
import (
	compute "github.com/go-compute/mean/lib"
)
```

#### compute.Mean( arr []float64 ) ( mean float64 )

Computes the arithmetic mean of a numeric array.

``` golang
var data = make( []float64, 101 )
for i := 0; i < len( data ); i++ {
	data[ i ] = float64( i )
}
mu := compute.Mean( data )
// returns 50
```


## Examples

``` golang
package main

import (
	"fmt"
	compute "github.com/go-compute/mean/lib"
)

func main() {
	var data = make([]float64, 101)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	mu := compute.Mean(data)
	fmt.Println("Mean: ", mu)
}
```

To run the example code from the top-level application directory,

``` bash
$ go run ./examples/mean.go
```


## Code Quality

Code quality and style is checked using [golint](https://github.com/golang/lint). To install `golint` (note: you may need to install [Mercurial](http://mercurial.selenic.com/downloads)),

``` bash
$ go get github.com/golang/lint/golint
```

To run the linter, execute the following command in the top-level package directory:

``` bash
$ make lint
```


## Tests

### Unit

Unit tests use the Go test [package](http://golang.org/pkg/testing/). To run the tests, execute the following command in the top-level package directory:

``` bash
$ make test
```

All new feature development should have corresponding unit tests to validate correct functionality.


### Test Coverage

This package uses the Go test [package](http://golang.org/pkg/testing/) as its code coverage tool. To generate a test coverage report, execute the following command in the top-level package directory:

``` bash
$ make test-cov
```

Running the coverage command creates a `./reports/coverage` directory. To access an HTML version of the report,

``` bash
$ make view-cov
```

Alternatively, for a report containing counts for how many times each statement is run,

``` bash
$ make view-cov-count
```


### Benchmarks

This package uses the Go test [package](http://golang.org/pkg/testing/) for running benchmarks. To run the benchmarks, execute the following command in the top-level package directory:

``` bash
$ make benchmarks
```



## License

[MIT license](http://opensource.org/licenses/MIT). 


---
## Copyright

Copyright &copy; 2014. Athan Reines.


[travis-image]: http://img.shields.io/travis/go-compute/mean/master.svg
[travis-url]: https://travis-ci.org/go-compute/mean

[coveralls-image]: https://img.shields.io/coveralls/go-compute/mean/master.svg
[coveralls-url]: https://coveralls.io/r/go-compute/mean?branch=master

[github-issues-image]: http://img.shields.io/github/issues/go-compute/mean.svg
[github-issues-url]: https://github.com/go-compute/mean/issues