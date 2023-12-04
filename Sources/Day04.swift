import Algorithms
import Foundation


struct Day04: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

    struct Winner {
        let numbers: [Int]
        func check( card: Card ) -> Int {
            var value = 0
            
            for number in card.numbers {
                if numbers.contains(number) {
                    if value == 0 { value = 1}
                    else { value *= 2 }
                }
            }
            return value
        }
    }
    
    struct Card {
        let numbers: [Int]
    }
    
    func parse_numbers( string:String) -> [Int] {
        let empty : [Int] = []
        return string.split(separator: " ").map { substring in
            Int(substring)
        }.reduce(empty) { partialResult, value in
            partialResult + [value!]
        }
    }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      data.split(separator: "\n").map { line in
          let card_id = line.split(separator: ":")[0]
          let winner_string = line.split(separator: ":")[1].split(separator: "|")[0]
          let card_string = line.split(separator: ":")[1].split(separator: "|")[1]
          
          let card = Card(numbers: parse_numbers(string: String(card_string)))
          let winners = Winner(numbers: parse_numbers(string: String(winner_string)))
          
          return winners.check(card: card)
      }.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      return 0
  }
}
