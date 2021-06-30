import Darwin

let HELP = """
bin2source 1.1.0 (swift version)
Creates a C bytes array from a file.

USAGE:
    bin2source inputfile outputfile arrayname [--amiga]

EXAMPLE:
    bin2source test test.c TESTARRAY
"""
var amiga = false
let argc = CommandLine.arguments.count
let argv = CommandLine.arguments

if (argc == 4 || argc == 5 )  {
    if (argc == 5 && argv[4]  == "--amiga") {
        amiga = true
    }
    do {
        try bin2source(inputfile: argv[1], outputfile: argv[2], arrayname: argv[3], amiga: amiga)
        exit(0)
    }
    catch IoError.readFile { print("Can't open input file\n")
        exit(1)
    }
    catch IoError.writeFile {print("Can't open output file\n")
        exit(2)
    }

}
else {
    print(HELP)
}
