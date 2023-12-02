import Algorithms
import Foundation

func to_number(input:String) -> Int {
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    
    let first_value = Int(input)
    guard first_value != nil else {
        let num_value = formatter.number(from: input)
        guard num_value != nil else {
            return 0
        }
        return Int(truncating: num_value!)
    }
    return first_value!
}

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Create an array from the values
    func all_values() -> [ Int] {
        data.split(separator: "\n").map {
            // get first digit from the left
            let input = String($0)
            let digits =  try! Regex(#"(\d|one|two|three|four|five|six|seven|eight|nine|zero)"#)
            let reverse_digits = try! Regex(#"(\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|orez)"#)
            let first_digit = input.firstMatch(of: digits)
            let first_value = to_number(input: String(first_digit!.0))
            // get second digit from the right
            let last_digit = String(input.reversed()).firstMatch(of: reverse_digits)
            let last_value = to_number(input: String(last_digit!.0.reversed()))
            return first_value * 10 + last_value
        }
    }
  
  func digit_values() -> [ Int] {
      data.split(separator: "\n").map {
          // get first digit from the left
          let input = String($0)
          let digits = try! Regex(#"\d"#) // try! Regex(#"(\d|one|two|three|four|five|six|seven|eight|nine|zero)"#)
          let reverse_digits = try! Regex(#"\d"#) //try! Regex(#"(\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|orez)"#)
          let first_digit = input.firstMatch(of: digits)
          let first_value = to_number(input: String(first_digit!.0))
          // get second digit from the right
          let last_digit = String(input.reversed()).firstMatch(of: reverse_digits)
          let last_value = to_number(input: String(last_digit!.0.reversed()))
          return first_value * 10 + last_value
      }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
      return digit_values().reduce(0,+)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      return all_values().reduce(0,+)
  }
}
