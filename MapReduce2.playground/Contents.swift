let wordsArray = ["Cat", "Chicken", "fish", "Dog",
    "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

func buildIndexFromWords(words: [String]) -> [Entry] {
    var result =  [Entry]()
    
    var letters = [Character]()
    for word in words {
        let firstLetter = word.uppercaseString[word.startIndex] as Character
        
        if !letters.contains(firstLetter) {
            letters.append(firstLetter)
        }
        
    }
    for letter in letters {
        var wordsPerFirstLetter = [String]()
        for word in words {
            let firstLetter = word.uppercaseString[word.startIndex] as Character
            
            if firstLetter == letter {
                wordsPerFirstLetter.append(word)
            }
        }
        result.append((letter, wordsPerFirstLetter))
    }
    
    return result
}

print(buildIndexFromWords(wordsArray))

// Shorter Way
func distinct<T: Equatable>(source: [T]) -> [T] {
    var unique = [T]()
    for item in source {
        if !unique.contains(item) {
            unique.append(item)
        }
    }
    return unique
}


func buildIndexTheShorterWay(words: [String]) -> [Entry] {
    func firstLetterFrom(str: String) -> Character {
        return str.uppercaseString[str.startIndex] as Character
    }
    
    let distinctLetters = distinct(words.map(firstLetterFrom))
    
    return distinctLetters.map { (letter) -> Entry in
        return (letter, words.filter({ (word) -> Bool in
            firstLetterFrom(word) == letter })) as Entry
        }
}

print(buildIndexTheShorterWay(wordsArray))
