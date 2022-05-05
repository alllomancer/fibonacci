package main

import (
	"testing"
)

// TestHelloName calls greetings.Hello with a name, checking
// for a valid return value.
func TestFib(t *testing.T) {
	out := Fibonacci(1)
	exp := "0, 1"
	if out != exp {
		t.Errorf("got %s, want %s", out, exp)
	}
}
