object CheckNonAscii { def main(args: Array[String]) {

// start script

import java.io.File
import scala.io.Source

val debug = System.getProperty("debug", "false").toBoolean

val target = """(".*[^\p{ASCII}]+.*")""".r
val comment = """^\s*(\*|//)""".r
val files = args map { new File(_) } filter { _.isFile }
var printFile = false
for (file <- files) {
  if (debug) println(file + " processing...")
  val lines = getLines(file)
  var lineNum = 0
  for (line <- lines) {
    lineNum += 1
    if (comment.findFirstIn(line).isEmpty) {
      val found = target.findFirstIn(line)
      if (found isDefined) {
        if (!printFile) {
          println("# " + file)
          printFile = true
        }
        val foundStr = found.get
        println("line %d: [%s]" format (
          lineNum, line.replace(foundStr, ">>" + foundStr + "<<")
        ))
      }
    }
  }
  printFile = false
}

def getLines(file: File) = {
  val src = Source.fromFile(file)
  try {
    src.getLines.toList
  } finally {
    src.close()
  }
}
// end script

}}
