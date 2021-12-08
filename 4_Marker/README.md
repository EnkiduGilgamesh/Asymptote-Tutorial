# 4 Marker

## 4.1 Falling a Region

Command `fill` fills the region appointed. Below is a simple way of how it can be used

```c
fill((0,0){up}..(1,1)..(2,sqrt(2))--(2,0)--cycle);
```

Notice that in Asymptote the earlier a command is, the topper the disgram is of in the output.

```c
fill((0,0){up}..(1,1)..(2,sqrt(2))--(2,0)--cycle, mediumgray);
draw((-.1,0)--(2,0),arrow=Arrow(TexHead));
draw((0,-.1)--(0,2),arrow=Arrow(TexHead));
draw((0,0){up}..(1,1)..(2,sqrt(2)));
```

## 4.2 Dot

If we draw dot by filling a circle region, the circle's shape and size would change when the disgram's aspect ratio changes.

There is a command to draw an unchangable dot with the aspect ration constant.

```c
dot((2,1));
dot((3,4),red);
```

## 4.3 Define path

Asymptote is a C-like language. We can define a path so that the path could be used many times.

```c
path s= (0,0){up}..(1,1)..(2,sqrt(2));
draw(s);
```

Also we can define an arrow by type `arrowbar`.

```c
arrowbar axisarrow = Arrow(TexHead);
draw(s,arrow=axisarrow);
```

The type `real`,short for 'real number', is the appropriate type to use for variable. The type `pair` is another important type in Asymptote.

Defining path, number, and other kinds of things through a meaningful name could make our code more readable and help us maintain our works. We can rewrite the former code by the below's style

```c
settings.outformat="pdf";
unitsize(1cm);

real xmin=-0.1;
real xmax=2;
real ymin=-0.1;
real ymax=2;

path s= (0,0){up}..(1,1)..(2,sqrt(2));
fill(s -- (xmax,0) -- cycle, mediumgray);
draw(s);

arrowbar axisarrow=Arrow(TeXHead);
draw((xmin,0) -- (xmax,0), arrow=axisarrow);
draw((0,ymin) -- (0,ymax), arrow=axisarrow);
```
