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
        amiga = true;
    }
    print(amiga)
    bin2source(inputfile: argv[1], outputfile: "toto", arrayname: "toto", amiga: amiga)
}
else {
    print(HELP)
}
