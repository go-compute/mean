/*
Package mean is a library for computing the arithmetic mean of a numeric array.
*/
package mean

/*
Mean computes the arithmetic mean of a numeric array.
*/
func Mean(arr []float64) (mean float64) {
	N := 0
	delta := 0.0
	mean = 0
	for _, x := range arr {
		N++
		delta = x - mean
		mean += delta / float64(N)
	}
	return mean
}
