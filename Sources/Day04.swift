import Algorithms
import Foundation


struct Day04: AdventDay {
    
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

    struct Card {
        let id: Int
        var count: Int = 1
        let winners: [Int]
        let numbers: [Int]
        func check_power( ) -> Int {
            var value = 0
            
            for number in numbers {
                if winners.contains(number) {
                    if value == 0 { value = 1}
                    else { value *= 2 }
                }
            }
            return value
        }
        func check( ) -> Int {
            var value = 0
            
            for number in numbers {
                if winners.contains(number) {
                    value += 1
                }
            }
            return value
        }

        init(string:String) {
            id = Int(string.split(separator: ":")[0].split(separator: " ")[1])!
            let winner_string = string.split(separator: ":")[1].split(separator: "|")[0]
            let card_string = string.split(separator: ":")[1].split(separator: "|")[1]
            
            winners = parse_numbers(string: String(winner_string))
            numbers = parse_numbers(string: String(card_string))

        }
    }

    static func parse_numbers( string:String) -> [Int] {
        let empty : [Int] = []
        return string.split(separator: " ").map { substring in
            Int(substring)
        }.reduce(empty) { partialResult, value in
            partialResult + [value!]
        }
    }


  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      let lines = data.split(separator: "\n")
      let results = lines.map { line in
          let card = Card(string: String(line))
          
          return card.check_power()
      }
      return results.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      let lines = data.split(separator: "\n")
      var cards = lines.map { line in
          Card(string: String(line))
      }
      
      for card_index in 0..<cards.count {
          let card = cards[card_index]
          let cards_won = card.check()
          if cards_won > 0 {
              for won_index in 1...cards_won {
                  var won_card = cards[card_index+won_index]
                  won_card.count += card.count  // if we have multiple copies of this card, each one wins
                  cards[card_index+won_index] = won_card
              }
          }
      }
      
      return cards.reduce(0) { partialResult, card in
          partialResult+card.count
      }
  }
}
