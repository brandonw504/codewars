import Foundation

// Next bigger number with the same digits
func nextBigger(num: Int) -> Int? {
    let result: Int = arrayToNum(orderDigits(numToArray(num), start: findStart(numToArray(num))))
    return result > num ? result : nil
}

func numToArray(_ num: Int) -> [Int] {
    var digits: [Int] = []
    var number: Int = num
    while number >= 1 {
        digits.append(number % 10)
        number /= 10
    }
    return digits
}

func orderDigits(_ digits: [Int], start: Int) -> [Int] {
    var new: [Int] = digits
    var remaining: [Int] = []
    var result: [Int] = []
    var index: Int = 0
    var run: Bool = false
    
    outerLoop: for count in start..<new.count {
        for digit in count..<new.count {
            if new[count] > new[digit] {
                run = true
                new.swapAt(count, digit)
                remaining = new
                index = digit
                for i in index..<digits.count {
                    remaining.remove(at: index)
                    result.append(new[i])
                }
                break outerLoop
            }
        }
    }
    
    guard run else {
        return digits
    }
    
    result.reverse()
    remaining.sort()
    for digit in remaining {
        result.append(digit)
    }
    return result
}

func findStart(_ digits: [Int]) -> Int {
    var smallest: Int = digits.count
    var stop: Int = digits.count
    var result: Int = 0
    for index in 0..<stop {
        for i in index..<digits.count {
            if digits[i] < digits[index] {
                stop = i
                if i < smallest {
                    smallest = i
                    result = index
                }
                break
            }
        }
    }
    return result
}

func arrayToNum(_ arr: [Int]) -> Int {
    var result: Int = 0
    var multiplier = Int(pow(Double(10), Double(arr.count - 1)))
    for digit in arr {
        result += digit * multiplier
        multiplier /= 10
    }
    return result
}

if let result = nextBigger(num: 3894) {
    print(result)
} else {
    print("failed")
}

func betterNextBigger(num: Int) -> Int? {
    var digits = String(num).compactMap { $0.wholeNumberValue }
    var i = digits.count - 1
    
    while i > 0 && digits[i - 1] >= digits[i] {
        i -= 1
    }
    
    guard i > 0 else { return nil }
    
    var j = digits.count - 1
    while digits[j] <= digits[i - 1] {
        j -= 1
    }
    
    digits.swapAt(i - 1, j)
    
    j = digits.count - 1
    while i < j {
        digits.swapAt(i, j)
        i += 1
        j -= 1
    }
    
    return Int(digits.reduce("", { $0 + String($1) }))
}
