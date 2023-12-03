import Cocoa

var greeting = "Hello, playground"

let a = "......1234*......"
let part_regex = try Regex( #"[^\d.]"#)
let matches = a.matches(of: part_regex)
matches[0].output[0].substring

let range = 0...10
let value = 10

range.contains(value)
