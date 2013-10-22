package njau.org.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class FileHelper {
/**
* @param args
*/
public static void main(String[] args) {
   // TODO Auto-generated method stub
   File src = new File("F:/Test/copy/aaa/ati.docx");
   File des = new File("F:/Test/copy/vvv/ati.docx");
  
   try {
    copyUseChannel(src, des);
   } catch (IOException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
}

public static void copyUseChannel(File srcFile, File destFile)
    throws IOException {
   if ((!srcFile.exists()) || (srcFile.isDirectory())) {
    return;
   }
   if (!destFile.exists()) {
    destFile.createNewFile();
   }
   FileChannel out = null;
   FileChannel in = null;
   try {
    out = new FileOutputStream(destFile).getChannel();
    in = new FileInputStream(srcFile).getChannel();
    ByteBuffer buffer = ByteBuffer.allocate(102400);
    int position = 0;
    int length = 0;
    while (true) {
     length = in.read(buffer, position);
     if (length <= 0) {
      break;
     }
     System.out.println("after read:" + buffer);
     buffer.flip();
     System.out.println("after flip:" + buffer);
     out.write(buffer, position);
     position += length;
     buffer.clear();
     System.out.println("after clear:" + buffer);
    }
   } finally {
    if (out != null) {
     out.close();
    }
    if (in != null) {
     in.close();
    }
    srcFile.deleteOnExit();
   }
}
}
