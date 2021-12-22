# 7 Text

## 7.1 Label

The simplest way to add text is the `lable` command hvs been introduced in former. In addition, the alignment of the label can be set by an option of direction.

```c++
label("$x$", (xmax,0), align=E);
```

The `E` (East) actually means `(1,0)`, as such, alignment can be added to each other and multiplied by real numbers

```c++
label("$x$", (xmax,0), align=2.5E+S/2);
```

Hence, in order to align rhe label in center, we can use `align=(0,0)`.

## 7.2 Path Lable

When drawing a path, we can put a label to it by using the `Lable` parameter. Firstly we need to set a `Label` value.

```c++
Label Label(string s, 
            position position,
            string size="", 
            align align=NoAlign, 
            pen p=mullpen, 
            embed embed=Rotate, 
            filltype filltype=NoFill);
```

NOTICE that the `Label` is both a data type and a built-in function name.

Then we can do like below

```c++
Label Lx= Label("$x$", position=EndPoint);
Label Ly = Label("$y$", position=BeginPoint);
Label Lz = Label("$z$", position=MidPoint);
draw((0,0) -- (0,4), arrow=Arrow(TeXHead),
L=Lx);
draw((1,0) -- (1,4), arrow=Arrow(TeXHead),
L=Ly);
draw((2,0) -- (2,4), arrow=Arrow(TeXHead),
L=Lz);
```

The `filltype` can be regarded as the label's background. The parameter `filltype=Fill(color)` can replaced the background with the `color`.

```c++
defaultpen(fontsize(10pt));
Label L = Label("$f(x)$", align=(0,0),
position=MidPoint, filltype=Fill(white));
draw((0,0) -- (0,sqrt(1.4)), L=L, arrow=Arrows(),
bar=Bars);
```

## 7.3 Multiple Text

Another way to set label to path is the `label(Label L, path g)` function which can add label to a created path.

```c++
path p =(0,0) .. (4,.3) .. (5,-.3) .. (5,-4);
draw(p);
Label L1 = Label("BeginPoint", position=BeginPoint);
label(L1, p);
Label L2 = Label("MidPoint", position=MidPoint);
label(L2, p);
Label L3 = Label("EndPoint", position=EndPoint);
Label L4 = Label("Relative(0.25)", position=Relative(0.25));
label(L3, p);
label(L4, p);
```

There is function that enhances the `label` function with labels can slope along with the path.

The `Relative` function means the relative position to the path. If a single number is given to it, it means the length percent to the beginning of the path. We can also give a pair to it as an **alignment**, it means the alignment position relative the the path. In paticular, `align=Relative(E)` will put the label to the right of the path direction (i.e., below the path, if it is going from left to the right); while `align=Relative(W)` will put the label to the left of the path direction (above the path, if it is going from left to right).

```c++
void pathlabel(picture pic = currentpicture, Label L, path g,
               real position=0.5, align align=NoAlign, bool sloped=false,
               pen p=currentpen, filltype filltype=NoFill) {
    Label L2 = Label(L, align, p, filltype,
    position=Relative(position));
    if (sloped) {
        pair direction = dir(g, reltime(g, position));
        real angle = degrees(atan2(direction.y, direction.x));
        L2 = rotate(angle)*L2;
    }
    label(pic, L2, g);
}
```

## 7.3 Formatting Text

Function

```c++
string format(string s, int n, string locale="");
```

returns a string containing `n` formatted according to the C-style formating string. For instance

```c++
label(format("I have %4.2f cm tall", 1.73333), p, SE);
```

## 7.4 Text Operator

String can be directly concatenated with the `+` operator. For instance

```c++
string s="a" + "b";
```

## 7.5 True Shift

The alignment varies the distant when the size rescaled. That probably makes some labels overlap with the adjacent components. Although we can change the position time after time, it's tedious and nor intuitive.

Unfortunately, there is no solution in plain that Asymptote gives to put the label in a position with a fixed distance. In the tutorial, the writter write a function below to solve the issue

```c++
void drawshifted(path g, pair trueshift, 
                 picture pic = currentpicture, Label label="", 
                 pen pen=currentpen, arrowbar arrow=None, 
                 arrowbar bar=None, margin margin=NoMargin, 
                 marker marker=nomarker){
    pic.add(new void(frame f, transform t) {
        picture opic;
        draw(opic, L=label, shift(trueshift)*t*g, p=pen,
        arrow=arrow, bar=bar,
        margin=margin, marker=marker);
        add(f,opic.fit());
    });
    pic.addBox(min(g), max(g), trueshift+min(pen), trueshift+max(pen));
}
```

With this definition in place, the command, for instance, `drawshifted(g,(0.4cm, 0))` should draw the path `g` shifted exactly 4 millimeters to the right of its *natural position*; and this shift of 4 millimeters will remain the same, regardless of the scaling.

```c++
size(***);
draw(unitcircle);
drawshifted(unitcircle, trueshift=(0.4cm,0), pen=blue);
```

Replace the \*\*\* with whatever you want.
