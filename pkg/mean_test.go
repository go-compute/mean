package mean

import (
	"testing"
)

/*
TestMean tests the Mean function and confirms that the function correctly computes the mean of a numeric array.
*/
func TestMean(t *testing.T) {
	var data = make([]float64, 101)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	mu := Mean(data)
	if mu != 50 {
		t.Errorf("Mean() = %d; Expected = 50", mu)
	}
}

/*
BenchmarkMean benchmarks Mean performance.
*/
func BenchmarkMean(b *testing.B) {
	var data = make([]float64, 301)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	b.ResetTimer()
	for j := 0; j < b.N; j++ {
		Mean(data)
	}
}
