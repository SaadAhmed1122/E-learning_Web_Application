package MVC.Controller;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;

public class Encryption_Decryption_password {
    public static String encryption(String password) {
        try {
            String key = "Bar12345Bar12345"; // 128 bit key
            // Create key and cipher
            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            // encrypt the text
            cipher.init(Cipher.ENCRYPT_MODE, aesKey);
            byte[] encrypted = cipher.doFinal(password.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : encrypted) {
                sb.append((char) b);
            }

            // the encrypted String
            String enc = sb.toString();
            System.out.println("encrypted:" + enc);
            password = enc;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return password;
    }

    public static String decryption(String decryption_password) {
        String decrypted = null;
        try {
            String key = "Bar12345Bar12345"; // 128 bit key
            // Create key and cipher
            Key aesKey = new SecretKeySpec(key.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            // encrypt the text

            // now convert the string to byte array
            // for decryption
            byte[] bb = new byte[decryption_password.length()];
            for (int i = 0; i < decryption_password.length(); i++) {
                bb[i] = (byte) decryption_password.charAt(i);
            }

            // decrypt the text
            cipher.init(Cipher.DECRYPT_MODE, aesKey);
            decrypted = new String(cipher.doFinal(bb));
            System.err.println("decrypted:" + decrypted);
            decrypted = decryption_password;


        } catch (Exception e) {
            e.printStackTrace();
        }
        return decrypted;
    }

}
