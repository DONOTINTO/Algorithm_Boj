// MARK: 재귀함수(Recursive Function)

//******************************************************
//                재귀함수 특징 및 기타 내용
//******************************************************
/*
 재귀함수란?
 - 내 함수 안에서 일정한 조건 하에 내 함수를 다시 호출하는 형태
 - 탈출 조건이 없다면 무한 반복(재귀)에 빠질 수 있음
 
 1. Factorial을 통해 이해하는 재귀함수
 2. Fibonacci Numbers을 통해 이해하는 재귀함수
*/

//=====================================================
//                팩토리얼 재귀함수 구현
//=====================================================
func factorial(count: Int) -> Int {
    if count == 1 {
        return 1
    }
    return (count * factorial(count: count - 1))
}

factorial(count: 5)

/*
 factorial(5) = 5 * factorial(4) (24) -> 120
 factorial(4) = 4 * factorial(3) (6)  -> 24
 factorial(3) = 3 * factorial(2) (2)  -> 6
 factorial(2) = 2 * factorial(1) (1)  -> 2
 factorial(1) = 1
 */


//=====================================================
//              피보나치 수열 재귀함수 구현
//=====================================================
func fibonacciNumbers(_ n: Int) -> Int {
    if n == 1 || n == 0 { return n }
    
    return fibonacciNumbers(n - 1) + fibonacciNumbers(n - 2)
}

print(fibonacciNumbers(10))

/*
 (1,1,2,3,5,8,13,21,34)
 
 fibonacciNumbers(7) = fibonacciNumbers(6) + fibonacciNumbers(5) // 8 + 5 = 13
 fibonacciNumbers(6) = fibonacciNumbers(5) + fibonacciNumbers(4) // 5 + 3 = 8
 fibonacciNumbers(5) = fibonacciNumbers(4) + fibonacciNumbers(3) // 3 + 2 = 5
 fibonacciNumbers(4) = fibonacciNumbers(3) + fibonacciNumbers(2) // 2 + 1 = 3
 fibonacciNumbers(3) = fibonacciNumbers(2) + fibonacciNumbers(1) // 1 + 1 = 2
 fibonacciNumbers(2) = fibonacciNumbers(1) + fibonacciNumbers(0) // 1 + 0 = 1
 */
