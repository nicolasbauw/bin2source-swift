import Foundation

// returns 0:OK|1:Can't open input file|2:Can't open output file
func bin2source(inputfile: String, outputfile: String, arrayname: String, amiga: Bool) -> Int {
    if let bytes: [UInt8] = readFile(file: inputfile) {
        print(bytes)
    } else {
        return 1
    }
    return 0
}

// Reads a file, returns its contents as a bytes array
func readFile(file: String) -> [UInt8]? {
    let url = URL(fileURLWithPath: file)
    print(url)
    do {
        // Reads the raw data from the file
        let rawdata: Data = try Data(contentsOf: url)
        // Returns the raw data as an array of bytes
        return [UInt8](rawdata)
    } catch {
        // Can't read the file
        return nil
    }
}