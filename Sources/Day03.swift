import Algorithms

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    var partLocations: [PartLocation]

    var lines: [String] 
    
    struct PartLocation {
        let x,y: Int
        let symbol: String
    }
    
    struct Part {
        let number: Int
        let location: PartLocation
        var description : String {
            return "\(number): \(location.symbol)"
        }
        var debugDescription: String {
            return "\(number): \(location.symbol)"
        }
    }
    
    init(data: String) {
        self.data = data
        self.lines =  data.split(separator: "\n").map {
            String($0)
        }
        do {
            let part_regex = try Regex( #"[^\d .]"#)
            var locations: [PartLocation] = []
            for line_no in 0..<lines.count {
                let line = String(lines[line_no])
                let result = line.matches(of: part_regex)
                for match in result {
                    let part = PartLocation(x: match.output[0].range!.lowerBound.utf16Offset(in: line), y: line_no, symbol: String(match.output[0].substring!) )
                    locations += [part]
                }
            }
            partLocations = locations
        } catch {
            partLocations = []
        }

    }
    
    func findAdjacentPart(xRange: Range<Int>, y: Int) -> [PartLocation] {
//        var locations: [PartLocation] = []
        
        let line_range = max(y-1,0)...min(y+1,lines.count)
        // column-range needs to be ..< because the string range is
        let column_range = max(xRange.lowerBound-1,0)..<min(xRange.upperBound+1,lines[0].count)

        // filter on any part within the range
        let candidates = partLocations.filter { location in
            column_range.contains(location.x) && line_range.contains( location.y)
        }
        
        return candidates
    }
    
  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      // search for part locations (line, column) containing not '.' or \d  -> Part(x,y)
      do {
          // scan each input line for part numbers
          let partno_regex = try Regex(#"(\d+)"#)
          var parts: [Part] = []
          for line_no in 0..<lines.count {
              let line = lines[line_no]
              let result = line.matches(of: partno_regex)
              for match in result {
                  assert(!match.range.contains(match.range.upperBound))
                  let locations = findAdjacentPart(xRange:match.range.lowerBound.utf16Offset(in: line)..<match.range.upperBound.utf16Offset(in: line), y:line_no)
                  for location in locations {
                      let part = Part(number: Int(String(match.output[0].substring!))!, location: location)
                      parts += [part]
                  }
              }
          }
          // with line number and position (range.start->end)
          //    look for parts that are adjacent (within 1 x,y) of part number

          // Calculate the sum of the first set of input data
          return parts.reduce(0) { partialResult, part in
              partialResult + part.number
          }
      } catch {
          return 0
      }
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
      return 0
  }
}
