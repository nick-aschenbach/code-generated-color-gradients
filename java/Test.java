import java.awt.Color;

public class Test {
  public static void main(String args[]) {
    ColorGradientManager cgm = new ColorGradientManager();
    cgm.select("Land Sea");

    for (Color c : cgm.gradient()) {
      System.out.print(c + " ");
    }
  }
}
