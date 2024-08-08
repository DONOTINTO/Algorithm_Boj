//
//  sieveOfEratosthenes.swift
//  SolvedEverything
//
//  Created by 이중엽 on 8/8/24.
//

import Foundation

func sieveOfEratosthenes(upTo limit: Int) -> [Int] {
    guard limit >= 2 else { return [] }  // 2보다 작은 경우 빈 배열 반환

    // 0과 1은 소수가 아니므로 false로 설정
    var isPrime = [Bool](repeating: true, count: limit + 1)
    isPrime[0] = false
    isPrime[1] = false

    // 2부터 시작하여 각 숫자의 배수를 지웁니다.
    let sqrtLimit = Int(sqrt(Double(limit)))
    
    for number in 2...sqrtLimit {
        if isPrime[number] {
            // 현재 숫자의 배수를 지웁니다.
            for multiple in stride(from: number * number, through: limit, by: number) {
                isPrime[multiple] = false
            }
        }
    }

    // 소수인 숫자만 필터링하여 반환합니다.
    return isPrime.enumerated()
        .compactMap { return $1 ? $0 : nil }
}

// 사용 예
let limit = 50
let primes = sieveOfEratosthenes(upTo: limit)
print("Primes up to \(limit): \(primes)")
