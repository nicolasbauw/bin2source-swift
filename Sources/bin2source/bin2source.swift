import Foundation

enum IoError: Error {
    case readFile
    case writeFile
}

// writes the C source from a binary file
func bin2source(inputfile: String, outputfile: String, arrayname: String, amiga: Bool) throws {
    if let bytes: [UInt8] = readFile(file: inputfile) {
        let url = URL(fileURLWithPath: outputfile)
        var outfile = (amiga ? """
            #include <exec/types.h>
            const UBYTE \(arrayname)[\(bytes.count)] = {\n
            """ : 
            """
            typedef unsigned char UINT8;
            const UINT8 \(arrayname)[\(bytes.count)] = {\n
            """)
        
        for byte in bytes {
            outfile += "\t"+String(byte)+",\n"
        }
        outfile += "};\n"

        do {
            try outfile.write(to: url, atomically: false, encoding: .utf8)
        }
        catch { throw IoError.writeFile }       // Can't write the file
    } else {
        throw IoError.readFile                  // Can't read the file
    }
}

// Reads the raw data from a file and returns an array of bytes
func readFile(file: String) -> [UInt8]? {
    let url = URL(fileURLWithPath: file)
    
    if let rawdata: Data = try? Data(contentsOf: url) { return [UInt8](rawdata) }
    return nil          // Can't read the file
}