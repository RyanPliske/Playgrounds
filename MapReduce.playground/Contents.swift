// Apple's Filter
var evens = Array(1...10).filter{ $0 % 2 == 0 }
print(evens)
// My Filter
extension Array {
    func myFilter(predicate: (Array.Generator.Element) -> Bool) -> [Array.Generator.Element] {
        var result = self
        result.removeAll()
        for element in self {
            if predicate(element) {
                result.append(element)
            }
        }
        return result
    }
}

evens = Array(1...10).myFilter { $0 % 2 == 0 }
print(evens)

// Sum Even numbers 1 through 10
let sumEvens = Array(1...10)
    .filter{ $0 % 2 == 0 }
//    .reduce(0) { (total, number) in total + number }
//    .reduce(0) {$0 + $1}
    .reduce(0,combine: +)

// Find Max number 1 through 10
let maxNumber = Array(1...10).reduce(0, combine: { max($0, $1) })
print(maxNumber)

// Convert Array of Ints to print out as a String
let numbersString: String = Array(1...10).reduce("Numbers: ", combine: { $0 + " \($1)" })
print(numbersString)


let stringDigits = ["3", "1", "4", "1"]
// Convert Array of String to Int and Sum the result: Output should be 9
let sum = stringDigits.reduce(0) { $0 + Int($1)! }
print(sum)
// Convert Array of String to Int: Output should be an Int with value of 3141
let digit: Int = stringDigits.reduce(0) { Int("\(String($0) + $1)")! }
print(digit)
// Convert Array of String to Array of Int
let digits: [Int] = stringDigits.map { Int($0)! }
print(digits)

extension Array {
    func myReduce<T, U>(seed:U, combiner:(U,T) -> U) -> U {
        var current = seed
        for item in self {
            current = combiner(current, item as! T)
        }
        return current
    }
}

let sum2 = stringDigits.myReduce(0) { $0 + Int($1)! }
print(sum2)




