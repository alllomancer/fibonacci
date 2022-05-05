package main

import (
	"fmt"
	"math/rand"
	"os"
	"os/signal"
	"strconv"
	"strings"
	"syscall"
	"time"
)

func Fibonacci(n int) string {
	var sb strings.Builder
	t1 := 0
	t2 := 1
	nextTerm := 0

	for i := 1; i <= n+1; i++ {
		if i == 1 {
			sb.WriteString(strconv.Itoa(t1))
			sb.WriteString(", ")
			continue
		}
		if i == 2 {
			sb.WriteString(strconv.Itoa(t2))
			continue
		}
		nextTerm = t1 + t2
		t1 = t2
		t2 = nextTerm
		sb.WriteString(", ")
		sb.WriteString(strconv.Itoa(nextTerm))
	}
	return sb.String()
}

func main() {
	c := make(chan os.Signal)
	signal.Notify(c, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-c
		fmt.Println("exit...")
		os.Exit(1)
	}()
	for {
		n := rand.Intn(50) + 1
		fmt.Println("selected number is: ", n)
		out := Fibonacci(n)
		fmt.Println(out)
		time.Sleep(60 * time.Second) // or runtime.Gosched() or similar per @misterbee
	}

}
