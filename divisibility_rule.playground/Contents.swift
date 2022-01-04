import Foundation

func thirt(_ n: Int) -> Int {
    var num: Int = n
    var digits: [Int] = []
    while num > 10 {
        var counter: Int = 0
        digits[counter] = Int(floor(Double(num % 10)))
        var product: Int = 10
        for _ in 0...counter {
            product *= 10
        }
        num /= product
        counter += 1
    }
    
    var sum: Int = 0
    var initial = -1
    while sum != initial {
        initial = sum
        for digit in digits {
            var counter: Int = 0
            var product: Int = 1
            for _ in 0...counter {
                product *= 10
            }
            sum += (product % 13) * digit
            counter += 1
        }
    }
    
    return sum
}

thirt(1234567)
