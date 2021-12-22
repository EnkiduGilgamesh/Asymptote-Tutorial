# 2 2D Image

- [2 2D Image](#2-2d-image)
  - [2.1 Line](#21-line)
  - [2.2 Size](#22-size)
  - [2.3 Arrow](#23-arrow)
  - [2.4 Bar](#24-bar)
  - [2.5 Margin](#25-margin)
  - [2.6 Curved Path](#26-curved-path)
  - [2.7 Markers](#27-markers)
  - [2.8 Fixed Size](#28-fixed-size)

## 2.1 Line

We can draw a line using command `draw`:

```c++
settings.outformat="pdf";
unitsize(1cm)
draw((-.1,0)--(2,0));
draw((0,-.1)--(0,2));
```

Above commands will generate two straight lines one of which is from position (-0.1,0) to position (1,0).

## 2.2 Size

The unit length is controlled by the command `unitsize(dimension)`.

A very similar command is `size(width-dimension,height-dimension)`. The latter command will try its best to make the disgram as large as posible, with the given ratio and never exceeding the specified dimension. This command is very useful when you are looking for a appropriate size to your disgram.

In addition, the dimension of command `size` is defaultly set 0 which means there is no request in this dimension.

If the `size` command is only given one dimension, the dimension will take effect in both dimensions.

Another optional parameter of `size` is `keepAspect` which is a boolean controlling whether the ratio is fixed and defaultly is *true*. For example:

```c++
size(3cm, 3cm, keepAspect=false);
```

## 2.3 Arrow

To make an axis, we need an arrow in the end of a line. This is easy:

```c++
draw((-.1,0)--(2,0), arrow=Arrow);
```

There are several styles of arrows in Asymptote code.

| | | |
| --- | --- | --- |
| Arrow() | Arrow(SimpleHead) | Arrow(HookHead) |
| ArcArrow() | ArcArrow(SimpleHead) | ArcArrow(HookHead) |
| Arrow(TexHead) | | |

Another option of `arrow` is the position. We can set the position where the arrow is produced like below

```c++
arrow=Arrow(TeXHead, position=0.5);
```

with the `0` is the beginning of the path.

## 2.4 Bar

Bar is how the line looks like in the beginning and the end with defaultly using `None` and optionally using. `Bars`, `EndBar`(`Bar`), `BeginBar`.

The bars can be used united with arrows.

```c++
draw((0,0) -- (0,sqrt(1.4)), L=L, arrow=Arrows(), bar=Bars);
```

This is a technique to use arrows if the line is too short to put arrows in.

```C++
draw((0,0) -- (1,0), bar=Bars);
arrow((0,0), W, length=0.3cm);
arrow((1,0), E, length=0.3cm);
```

## 2.5 Margin

The distance between arrows and the end point is `margin` optional with `NoMargin`, `DotMargin`, etc.

```c++
arrow(..., margin=DotMargin);
```

## 2.6 Curved Path

To draw a curved path by several coordinates, we can replace `--` with `..` between coordinates. Then, the path will be smooth.

```c++
draw((0,0)..(1,1)..(2,sqrt(2)));
```

We can give a parameter as the tangent after the coordinates to make the path more precise. For instance, we can make a rough sine curve as below

```c++
//draw((0,0){up}..(1,1)..(2,sqrt(2)));
draw((0,0){(1,1)}..{right}(pi/2,1)..{(1,-1)}(pi, 0)..{right}(3*pi/2,-1)..{(1,1)}(2*pi, 0));
```

## 2.7 Markers

We can use the marker option of draw cammand to make markers to the pairs we give.

```c++
draw((0,0){(1,1)}..{right}(pi/2,1)..{(1,-1)}(pi, 0)..{right}(3*pi/2,-1)..{(1,1)}(2*pi, 0), 
    marker=MarkFill[0]);
```

Here are all the built-in markers:

| option | description | option | description |
| --- | --- | --- | --- |
| Mark[0] | open circle | MarkFill[0] | filled circle |
| Mark[1] | open triangle | MarkFill[1] | filled triangel |
| Mark[2] | open square | MarkFill[2] | filled square |
| Mark[3] | open pentagon | MarkFill[3] | filled pentagon |
| Mark[4] | open triangle(upside down) | MarkFill[4] | filled triangle(upside down) |
| Mark[5] | x-mark | Mark[6] | asterisk |

## 2.8 Fixed Size

Sometimes, we need draw something with fixed size in a scalable image. Fortunately, there is a variant of the `draw` command that draws a scale-proof object at scalable location. Compare the two examples below

```c++
size(2cm);
...
path tick = (0,0) --(0,-0.15cm);
Label ticklabel = Label("$x$", position=EndPoint);
draw((x,0), tick, L=ticklabel);
path clippath=circle((x,0), 0.5);
draw(clippath, blue);
clip(clippath);
```

```c++
size(2cm);
...
path tick = (0,0) --(0,-0.15cm);
Label ticklabel = Label("$x$", position=EndPoint);
draw((x,0), tick, L=ticklabel);
path clippath=circle((x,0), 0.2);
draw(clippath, blue);
clip(clippath);
```

Replace the `...` with the any works and remember put the `x` in a appropriate position.

No matter how the `clippath` scaled, the length of the path `tick` is always 0.15cm in the output.