# 2 2D Image

## 2.1 Line

We can draw a line using command `draw`:

```c
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

```c
size(3cm, 3cm, keepAspect=false);
```

## 2.3 Arrow

To make an axis, we need an arrow in the end of a line. This is easy:

```
draw((-.1,0)--(2,0), arrow=Arrow);
```

There are several styles of arrows in Asymptote code.

| | | |
| --- | --- | --- |
| Arrow() | Arrow(SimpleHead) | Arrow(HookHead) |
| ArcArrow() | ArcArrow(SimpleHead) | ArcArrow(HookHead) |
| Arrow(TexHead) | | |
