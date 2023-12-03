import Algorithms
import Foundation

struct GameCubes {
    var red,green,blue:Int;
    func power() -> Int {
        var power = 1
        if self.red > 0 { power *= self.red }
        if self.green > 0 { power *= self.green }
        if self.blue > 0 { power *= self.blue }
        return power
    }
    
    static func cube_max( _ left: GameCubes, _ right: GameCubes) -> GameCubes {
        GameCubes(red: max(left.red,right.red), green: max(left.green,right.green), blue: max(left.blue,right.blue))
    }
    
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
                    var cube = GameCubes(red: 0, green: 0, blue: 0)
                    let color_map = color_data.split(separator: " ")
                    switch color_map[1] {
                    case "red": cube.red = Int(color_map[0])!
                    case "blue": cube.blue = Int(color_map[0])!
                    case "green": cube.green = Int(color_map[0])!
                    default: print("unexpected")
                    }
                    moves += [cube]
                }
            }
            return Game(moves: moves, number: game_number!)
        }
    }
    
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
      let max = GameCubes(red: 12, green: 13, blue: 14)
      return games.reduce(0, {
          var ok = true
          for move in $1.moves {
              if move.red > max.red { ok = false}
              if move.blue > max.blue { ok = false}
              if move.green > max.green { ok = false}
          }
          if ok { return $0 + $1.number }
          return $0
      })
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      return games.reduce(0, {
          let max_cubes = $1.moves.reduce(GameCubes(red: 0, green: 0, blue: 0), GameCubes.cube_max)

          return $0 + max_cubes.power()
      })
  }
}
