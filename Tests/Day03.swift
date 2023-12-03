import XCTest

@testable import AdventOfCode

// Make a copy of this file for every day to ensure the provided smoke tests
// pass.
final class Day03Tests: XCTestCase {
  // Smoke test data provided in the challenge question
  let testData = """
 .......262....300...................507.....961..............668.....................189.906...........................624..................
 ..148.................805..130..880*...........*684.............*......*..............*..-......%.................$........17...65....91*...
 ......272.....464.....=......*.........................208*.....260.967.38.......692*.........676............@247..652.585.#......@......74.
 .................*734........772......171.........728$.....52........................747.=866............350...........*....................
 ..328....21...........941......../.....*...243................429@......567$...623.................654..#.....*815....360......812%.........
 ..........$.....%....@....6....583.....598...&.114@...618......................+...............156.........817...../.................340....
 .....883........359.....*.*..........................*............@............................./...920............302.712...........*......
 ........*.....*......100..192.160........791......843...680*643.252.................322...354..........*.....+.........*............556.....
 .........958.580.................*.............................................879.....-..$............633...63......561.....289............
 ..............................745.......221..504-................356..............*827........355...............................*46.........
 ...................206..382...........$...........142@.105...534........./.......................*..........535.....................515.....
 ..201.....336.......-..*.....268..121..775...-...........%..............791.............129...449.....450..*.........790...........*........
 ............%.559*......7.....+..*..........865......895............930.....427..242......#...............414.830............37..809........
 ..................85.............466..550-..........+....................44...*...*.........361..215..........*......808.220*...............
 ................*......709....................577......430...&..148........*.696.988....801.*.....*..........202..25..*.....................
 .....636......14...........372.............64...*...........586.%...15..241.............&....387..447...............*..811....146...........
 .....-...........892*226....*....161.........%.623..................*...........$...............................................&.....657...
 ........987.................147.=....+.254..........887........773...321.....221....415.971..................74.......702..212..............
 ......@............182............335.....*...........*..77.......#......................./.....29..........%...........&..*.......872......
 ......643............*...................756.........677.*..........251......521..620......................................685.206.......132
 ............274*...........929.................871........686.542..%........*......*.......................882....756.............*859..*...
 ................516.........*.....................*..............*...289...10.....890..985...258...963...............*.................526..
 .............................610...............857........210..818......*.......@.........#..=......*.....968.........42..........732.......
 .............../..*453.................467..........376......$..........429..218.....................955..%..............357................
 .......841....493..............830#.......*342.........*........*................./....562....945................224.......*..435...........
 ..................843.803......................2........56...248.560.............281.....*.......*.........-........*5....728..*......156...
 ...822*288....352.*...+..............$.........$........................@..............794......539..-814..528.81.......+.......687.....*...
 ................*.783..../454.859....809..742........................663...267/..................................*.....847..............167.
 ....&371.296.484..............*..........=...........516.......925...............................#................441...............224.....
 .........#............594..417....458............112*.....65.....#.....337...357....#..369*277.825....386..................212..............
 ................651..#...........*.....$..................*............*.....*...125...................*......497.........*..............509
 ......320..........*......-...883..989..733.....668.905...997.......454.....353...........946....18.....340...&......515...774........*.....
 ......-.....880....476...955.......=................*...........58.....................23....*69.+..102..............*.............933.687..
 ........931....*..............................757....602.983......-..822..............*.............*.......732.....15......................
 ....../....*....463.............183$..961........*.......*....#...........572......618.............52..........@........205......*....&429..
 ...204......550............-.........%.........628.....240..588............*................................/..........*......167.776.......
 ................360....*....69..........*..........534..................%..340.....................885*912..52......949.....................
 .........483......*..46.754......-....607.346.....*..............851.302..................@....................-........330.-201............
 .........@...274.811..............819...........56......326......................496....650...........382......168.420...*.........452......
 ..............#........325.449........581...........112*........................+............163.......*.................407.......*...460..
 ......595.........*......*...................226+.................268..153.........#123........*.....$..877..........#..........361...*.....
 ......*........280.287.427...........755...........................%.........................722...323................307...................
 ..132.553...............................*.......117......450.109...............849.....749.................................105..537#..741...
 ...*.................................788.......*....691...%...$............148.....960..*....512.728#..544.624.....$......*.................
 .523..97...186..907....508....................739......*................*.....*856.&....15..................$.....911.......&..877..632.....
 ..............*.*.........*.........161*....+........381.............453.376..........................30..................806.......*.......
 ............560.877...773...............168..446..............465..............435@..24..622...%.................................=..347.....
 ...*165................-.......................................*......@816..............*....313..421......269....539.49.530..113...........
 768......*626.926....=.....676...981=............703.........682.&141....................444......=........@.........*......*......539......
 ......159.......$..362......../.......254.....14..=...............................219.................383.........*......182.............733
 .324........879.....................*.=...............316.....*480......*............*............439*.........621.961.......*481...........
 ....*...208*...........188.......763.....553...........*...957.......771.944........445......4...........375..............174.....903.665...
 .................651........851.......37*...........303.................................446......61......*......346................@...*....
 ......160....412*......../.....=.220.........354.........-.....838...........473..........#........$.870.......*............*........391....
 .....*....................218.....*.............*.....739..320*.........358....*...521......383.........*.....27...........107..............
 ...969...718..................+....200.534.237+..........................=..889....*..........@........396.......................103..243...
 ........&..................841...-......&........./748...655..325.................430............813.................618.....687...#..@.....
 ..........825...761............800......................*....&...........496............652...$..*...............206..*.....................
 ...................+....&584.........35..663*590.....677...................*........741*....908...293..918............570....$......%.......
 ...........794.......................&...................852*...........361...............-.................................502.769.82......
 ..535.......$............523*522................-..............847..........593..........267.....................................*..........
 ....*...........73...............................299..262..941*..................813..............682..........877........494...411.........
 ..528................*997....*...477........464.....................521........@....*315......#...=..............*..........................
 ............669...909.......342..*...........*..........444@...@.....-..611.911..............864......114....555..628..890..................
 ............*.....................444.....921................783.......*.......................................*........=...414.............
 ..........622..................................422..-...............404......&906..381............438..........605.........@.....389.352@...
 ....77.........519...282........720.....159=..*....87......225.605......125...........+.............*..860-......................=..........
 ...$...556.......-.....*..........#..........479............&....*.........*967...343..............400...........*883..................*881.
 ......*............207.653....113...359............227............357............*..........771...........426.905..............313..563.....
 ...74..233....959../.........*.........&............*...#.................543..64..*....179................*........@.............*.........
 .....*..........*.......707.341..........&489.....206..132..407..........*........224..*................310........255./.........136........
 ...251.......770........................................................475.............694....514.....................236..................
 ........944........-379...............403.....934......47........................................*..............694........359..............
 732.............14..........*..........*.........*.................720....325..............375.483.............*.....356&..............686..
 .......160..672*.........250.125....791.....&76...1.....&963...422..#........../....191......*................925..........771...405&.-.....
 ...205....%......402................................117........*.........887....509..........44.....417.................=.-.................
 ...................*............=..145......746.......*........861..804....*.........313...............*....*.........761.......638.........
 ..852..767.....#67.835......$.359..*..................789.@................675.938.............957..........459.652..............*...949....
 ........*.................977.....779.......348...627.....136.........+623..........964.............948+..........*.................=.......
 ........882......+............................./...#...............................*......311...152.......186......233.......374.......989..
 ..148.........125.....931......706%....#...379.........................181.......227..........*..........*..............581..*..............
 .....*..179..............*.............970.../.......605...........736*......................700......970.................*.........+.487...
 ....209...*..............810....790..............787*......................#...+....-...824......587......709*.....899.....283....324..*....
 ...........50...750............./.......633...............................364..66..593./......................115......-..............561...
 ...................#......989..............*217.......................620...........................................740.....*361....+.......
 ..........266.........647*....$..992....*...........318...345...........*..............-........252..797.................354........8...110.
 .............................375.....344.334.......*.......*..........460......558.....364.......#..$...........@....%..........3...........
 ...$14...314...652...............................626............%...................%.....................778....868..215...................
 ...........&....*.......$........241.................*796....552..738..#234...@....358............993....*..................................
 ................594..230..-..647*.....&............56.............*............479.....921..............519................426......713.....
 .....944*................404........53..349....$........459......986..+......=..............-666..............237...897#..*........&....755.
 .........176........280......714..........*..876.268...*.............946.492.113..........*..............................855................
 .....................*........*...936..................973.................*............736.......844.659....652.@............266...547.....
 ...677......@........426.....89........./...................185..........630.285............196...../....*...*....349....102....*....*......
 ........765..677................*..46....85.901.....*...440...................../..........*.............304..952............1........507...
 ...........=.........669......847....*........*..821......*.301.......880.................829.951.460....................876................
 .................466*......*.........69.....207.........419...*...................442............*...........-.....898.....=.667............
 ....421.56=................318....................................178...............+...............896*855...522..&..........%....151*405..
 ....*.......481-...70*401..............550...................*.......*296...91........998.566..112..........................................
 ...235.472..............................*......962....963.935...921.........+.....................-...........168.....=516.304...416*699....
 ........#...*10.................240=.....687..*...................*.475..-...........697.......................*..............*.............
 ..261.....47.......750....954.........=......274........-...203.570....*..71...........*...484..*.....%61...397..854...#.......523.....931..
 ..............34............$....%.....500........216.647............271.......908....906.......488...............*..92..634................
 ..........83*....................994.......511.55*........991...16.........417*....*......96...................697.................&........
 .............582.450=.....................................=.....*...............654.411........313..................29.........32.849.......
 .......563..............239.........&.............405............193......+.411.........%......*...&.....623.........$....+748..=.....840...
 ..........&......#.......-....761....639.275+.......*...................69..$....../.233..@..88.....226...*.....366................../......
 .............248.16............/...............+...556...........306............354......308..............682.../......894...#..............
 ..697.......*.........@..........959...125....297.......................*337...................72....108...............*......991.344....781
 ...*.......715...49.392.........*.......*................652/........#.......55*.......................-.844......./..344..........-........
 ...591....................334.701.......838.......................397....501....759.....-.........................946.......442.............
 ..................557*421...@.....749........500..........#170..........%............941..373....425..818.......................828.....237.
 ..793*144...........................$.302....*.....938*..................................*..........*....%.378........66..63...*............
 ............474...............893............267.......810................585..........558.......694......../.................340.701.......
 ..............#..798......332*.....855.....................592.589........&.....833=.........199......730.......+......177..................
 .................*..................*.........................*........................#.......*......*.....154.589...*.....................
 .....64*809........../............@.139............228..374....../.......771.........534........281...........*......506.......=............
 ..............427.750......546...98............707..=......&..381..877..*..........*........6.........%......489.........../.795............
 ...895.805*.....*.....................*694....=........848...............616.....69.86.....*..460......895.......544.....651.......14.886...
 ...........390...850..777.534..138..52..........570....@.........812.$71................795.......557............-.....................*....
 ..46*41...............*...........*................@.........613*.................584.......=........*...............106*....627.602....829.
 ........217*380.............721..928.873...........................593..353...............341..430..989..923.............695......-...%.....
 ..................586.......$.........*...207.......585&......485..*...*..........................*......*..........................929.....
 ............#.154*.....60.............95.......................*..138.764..........................425.275......%.331*664..854..........887.
 908.917..359........../........659........125..785...........499..........991....358..........102*...........903..........*.....409....-....
 ...*.........963*.../......408.............%........830*871...............*......*...828..........764.671................293...*............
 ....................559....=..........81............................391...969.513....*.......991........&..518.....208*.......75............
 .....461.560*......................../........950.........320%.....*................97........................#..........+675.....352...339.
 ......*......439.%101.709...302.870......838....@.....594........953.......514*862........339....................................*..........
 ...247...................@......*.................312....#.................................-...271..800...@..818.850....333*722...330..951..
 ........922.................184.666.............../..........................356...105.........#...*.....353./........................*.....
 832.....-.......758...800....$......................337.......419...........=.......*...258........926.........................../592..186..
 ...................+...........220.287...117....783......646..#.........451........750..........27.....$.......*750......890................
 ........719............982....%.......*..*.........*144.*..................*...........*764./.....*373..368.201..........@..................
 ......../..........388....*........115...432.............594............345..658$...442......833.................408.........=..........542.
 ..........27.#498..*.....286..+490...............................966.....................262.......................#..542.237...............
 72....251..#.......667.....................282..556..260...........%.$......................*....107..................*.....................
 .......*.......*..............................*..-...*...............64..#...=.....402..@....790.@.....................295.766...484..969...
 ......85....882.80.......184$................117........................454..583......*..351...............266....................&....*....
 .......................................................48...........................436........275...................869............258.....
"""

  func testPart1() throws {
    let challenge = Day03(data: testData)
      
    // 293693 is too low
    // 323676 is too low
    // 566997 is too high
    XCTAssertEqual(String(describing: challenge.part1()), "2265")
  }

  func testPart2() throws {
    let challenge = Day03(data: testData)
    XCTAssertEqual(String(describing: challenge.part2()), "64097")
  }
    
}
