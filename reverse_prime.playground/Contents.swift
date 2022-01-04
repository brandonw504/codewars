import Foundation

func backwardsPrime(_ start: Int, _ stop: Int) -> [Int] {
    return Array(start...stop).filter { isPrime($0) && isPrime(reverse($0)) && $0 != reverse($0) }
}

func reverse(_ num: Int) -> Int {
    var digits: [Int] = []
    var number: Int = num
    while number >= 1 {
        digits.append(number % 10)
        number /= 10
    }
    
    var result: Int = 0
    var multiplier = Int(pow(Double(10), Double(digits.count - 1)))
    for digit in digits {
        result += digit * multiplier
        multiplier /= 10
    }
    
    return result
}

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    } else if n <= 3 {
        return true
    }
    
    var i: Int = 2
    while i * i <= n {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

print(backwardsPrime(101, 199))

