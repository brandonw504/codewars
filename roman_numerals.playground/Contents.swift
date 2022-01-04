import Foundation

func decode(_ string: String) -> Int {
    let conversion: [Character: Int] = ["A": 0, "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var numerals: [Character] = []
    for character in string {
        numerals.append(character)
    }
    
    var number: Int = 0
    var previous: Character = "A"
    for letter in numerals {
        if conversion[previous]! < conversion[letter]! {
            number += (conversion[letter]! - (2 * conversion[previous]!))
        } else {
            number += conversion[letter]!
        }
        previous = letter
    }
    return number
}

func encode(_ number: Int) -> String {
    let numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    var num: Int = number
    var numeral = ""
    for i in 0..<numbers.count {
        while num / numbers[i] >= 1 {
            num -= numbers[i]
            numeral += roman[i]
        }
    }
    
    return numeral
}

func encode2(_ number: Int) -> String {
    var num = number
    var result = ""
    let _ = [(1000,"M"), (900,"CM"), (500,"D"), (400,"CD"), (100,"C"), (90,"XC"), (50,"L"), (40,"XL"), (10,"X"), (9,"IX"), (5,"V"), (4,"IV"), (1,"I")].map { (val, symbol) -> String in
        while num - val >= 0 {
            num -= val
            result += symbol
        }
        return result
    }
    return result
}

decode("MMMCMXIV")
encode(4)
encode2(4)
