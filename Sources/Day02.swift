import Algorithms
import Foundation

struct GameCubes {
    let red,green,blue:Int;
}

struct Game {
    let moves: [GameCubes];
    let number: Int;
}

struct Day02: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

    var games: [Game] {
        data.split(separator: "\n").map {
            // each games is on a line
            let game_info = $0.split(separator: ":")
            let game_number = Int(String(game_info[0].split(separator: " ")[1]))
            var moves: [GameCubes] = []
            for move_data in game_info[1].split(separator: ";") {
                for color_data in move_data.split(separator: ",") {
                    var red = 0
                    var blue = 0
                    var green = 0
                    let color_map = color_data.split(separator: " ")
                    switch color_map[1] {
                    case "red": red = Int(color_map[0])!
                    case "blue": blue = Int(color_map[0])!
                    case "green": green = Int(color_map[0])!
                    default: print("unexpected")
                    }
                    let cube = GameCubes(red: red, green: green, blue: blue)
                    moves += [cube]
                }
            }
            return Game(moves: moves, number: game_number!)
        }
    }
    
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
      let max_red = 12
      let max_green = 13
      let max_blue = 14
      return games.reduce(0, {
          var ok = true
          for move in $1.moves {
              if move.red > max_red { ok = false}
              if move.blue > max_blue { ok = false}
              if move.green > max_green { ok = false}
          }
          if ok { return $0 + $1.number }
          return $0
      })
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      return games.reduce(0, {
          var max_red = 0
          var max_green = 0
          var max_blue = 0
          var power = 1
          for move in $1.moves {
              if move.red > max_red { max_red = move.red }
              if move.blue > max_blue { max_blue = move.blue }
              if move.green > max_green { max_green = move.green }
          }
          if max_red > 0 { power *= max_red }
          if max_green > 0 { power *= max_green }
          if max_blue > 0 { power *= max_blue }

          return $0 + power
      })
  }
}
