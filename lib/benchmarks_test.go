package mean

import (
	"testing"
)

func BenchmarkMean( b *testing.B ) {
	var data []float64 = make([]float64, 301)
	for i := 0; i < len(data); i++ {
		data[i] = float64(i)
	}
	b.ResetTimer()
	for j := 0; j < b.N; j++ {
		Mean( data )
	}
}