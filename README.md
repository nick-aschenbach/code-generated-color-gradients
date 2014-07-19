code-generated-color-gradients
==============================

Image parser utility written in Ruby that generates Java code. 

The code generator utility is located in the `ruby` directory. It parses the png files located in the images directory and outputs Java arrays of type Color.

To run this code:

```
bundle
```

And then run the file:

```
ruby image_parser.rb > ColorGradients.java
```

This can then be incorporated into your project. It's possible to add or remove images, however please note that all the images are 256 pixels wide x 1 pixel tall. The size of the outputted Color arrays will depend on image width. It may be advisable to use a consistent width to avoid indexing out of bounds when switching between color arrays.

Example Output
--------------

```
import java.awt.Color;

public class ColorGradients {
  public static Color carribean_blues[] = {
    new Color(0, 33, 148),
    new Color(0, 34, 149),
    ...
  };
  ...
}
```

Color Manager
-------------

A simple color manager is located in the `java` directory. It contains roughly 40 different color gradients that are stored in a map. These can be referenced by name (e.g. "Land Sea"). A list of gradients is obtained by calling `getAllGradients()` on an instance of `ColorGradientManager`.

```
public class Test {
  public static void main(String args[]) {
    ColorGradientManager cgm = new ColorGradientManager();
    cgm.select("Land Sea");

    for (Color c : cgm.gradient()) {
      System.out.print(c + " ");
    }
  }
}
```
