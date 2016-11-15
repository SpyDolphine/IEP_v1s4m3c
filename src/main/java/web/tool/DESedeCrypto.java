package web.tool;
 
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
 
public class DESedeCrypto {
 
  /**
   * ��ȣȭ�ÿ� ����� Ű ����
   * 
   * @return Ű ���ڿ�
   */
  public SecretKey key() {
    SecretKey desKey = null;
    // TripleDES Ű ����, 24����Ʈ ���� ����
    // Java���� ������ 192bit, 24�� ����
    byte[] keydata = "soldeskdesededeveloper05".getBytes();
 
    try {
      DESedeKeySpec keySpec = new DESedeKeySpec(keydata);
      SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");
      desKey = keyFactory.generateSecret(keySpec);
    } catch (Exception e) {
      System.out.println(e);
    }
 
    return desKey;
 
  }
 
  /**
   * ��ȣȭ
   * 
   * @param text
   *          ��ȣȭ�� �Ϲ� ���ڿ�
   * @return ��ȣȭ�� ���ڿ�
   */
  public byte[] encrypt(String text) {
    byte[] ciphertext = null;
    String output = null;
 
    try {
      // ��ȣȭ ��ü ����
      Cipher cipher = Cipher.getInstance("TripleDES/ECB/PKCS5Padding");
 
      // key(): ��ȣȭ Ű, 24����Ʈ ����
      cipher.init(Cipher.ENCRYPT_MODE, key());
 
      // �־��� ���ڿ��� byte �迭�� ����
      byte[] plaintext = text.getBytes("UTF8");
 
      // ��ȣȭ
      ciphertext = cipher.doFinal(plaintext);
 
    } catch (Exception e) {
 
    }
    return ciphertext; // ��ȣȭ�� ���ڿ� ����
 
  }
 
  /**
   * ��ȣȭ, ������ ���ڿ��� ��ȯ
   * 
   * @param array
   *          ��ȣȭ ���ڿ�
   * @return �˾ƺ��� �ִ� ���ڿ� ����
   */
  public String decrypt(byte[] array) {
    String output = null;
 
    try {
      // ��ȣȭ ��ü ����
      Cipher cipher = Cipher.getInstance("TripleDES/ECB/PKCS5Padding");
      cipher.init(Cipher.DECRYPT_MODE, key());
 
      // ��ȣȭ ���� ���
      byte[] decryptedText = cipher.doFinal(array);
 
      output = new String(decryptedText, "UTF8");
 
    } catch (Exception e) {
      // System.out.println(e);
      e.printStackTrace();
    }
 
    return output;
 
  }
 
}
 