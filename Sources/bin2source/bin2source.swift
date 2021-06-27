import Foundation

func bin2source(inputfile: String, outputfile: String, arrayname: String, amiga: Bool) -> Int {
    if let bytes: [UInt8] = readFile(filePath: inputfile) {
        print(bytes)
}
return 0
}

func readFile(filePath file: String) -> [UInt8]? {
    let url = URL(fileURLWithPath: file)
    print(url)
    do {
        // Reads the raw data from the file
        let rawdata: Data = try Data(contentsOf: url)
        // Returns the raw data as an array of bytes
        return [UInt8](rawdata)
    } catch {
        // Couldn't read the file
        return nil
    }
}