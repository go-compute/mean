package mean

import (
	"testing"
)

func TestMean(t *testing.T) {
	var data []float64 = make([]float64, 101)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	mu := Mean(data)
	if mu != 50 {
		t.Errorf("Mean() = %d; Expected = 50", mu)
	}
}
