# 4 Marker

- [4 Marker](#4-marker)
  - [4.1 Falling a Region](#41-falling-a-region)
  - [4.2 Dot](#42-dot)
  - [4.3 Define path](#43-define-path)
  - [4.4 Path Times](#44-path-times)
  - [4.5 Intersection](#45-intersection)
  - [4.6 Tangent Line](#46-tangent-line)
  - [4.7 Disconnected Line](#47-disconnected-line)

## 4.1 Falling a Region

Command `fill` fills the region appointed. Below is a simple way of how it can be used

```c++
fill((0,0){up}..(1,1)..(2,sqrt(2))--(2,0)--cycle);
```

Notice that in Asymptote the earlier a command is, the topper the disgram is of in the output.

```c++
fill((0,0){up}..(1,1)..(2,sqrt(2))--(2,0)--cycle, mediumgray);
draw((-.1,0)--(2,0),arrow=Arrow(TexHead));
draw((0,-.1)--(0,2),arrow=Arrow(TexHead));
draw((0,0){up}..(1,1)..(2,sqrt(2)));
```

Another command is `filldraw`

```c++
filldraw((x,0) -- striptop -- (x+dx,0) -- cycle, black);
```

## 4.2 Dot

If we draw dot by filling a circle region, the circle's shape and size would change when the disgram's aspect ratio changes.

There is a command to draw an unchangable dot with the aspect ration constant.

```c++
dot((2,1));
dot((3,4),red);
```

## 4.3 Define path

Asymptote is a C-like language. We can define a path so that the path could be used many times.

```c++
path s= (0,0){up}..(1,1)..(2,sqrt(2));
draw(s);
```

Also we can define an arrow by type `arrowbar`.

```c++
arrowbar axisarrow = Arrow(TexHead);
draw(s,arrow=axisarrow);
```

The type `real`,short for 'real number', is the appropriate type to use for variable. The type `pair` is another important type in Asymptote.

Defining path, number, and other kinds of things through a meaningful name could make our code more readable and help us maintain our works. We can rewrite the former code by the below's style

```c++
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

## 4.4 Path Times

*Path time* is dependent on the number of "nodes" on a path, i.e., the number of points that are specified when the path is defined. **After a path is created, it should not be used in any way that depends on how it was created**. In particular, if one path is substituted for another with identical appearance, the rest of the code should still produce the same result.

A useful function

```c++
real[] times(path p, real x);
```

will returns all intersection times of path `p` with the vertical line through (x,0). The `real[]` type is an indexed list of `real` type. The elements of this list can be accessed as `a[0]` the first one, `a[1]`, `a[2]`...`a[n-1]`.

## 4.5 Intersection

Function

```c++
subpath(path p, real a, real b);
```

returns the subpath pf `p` running from path time `a` to path time `b`. For instance

```c++
settings.outformat="pdf";
size(4cm,0);
path p = (-2,0)..(0,7/4)..(6/4,0)..(0,-5/4).. /
        (-4/4,0)..(0,3/4)..(2/4,0)..(0,-1/4)..(0,0);
draw(p, arrow=ArcArrow(TeXHead,position=0.5));
real[] isections = times(p,1/3);

draw(subpath(p,isections[0],isections[1]), blue+linewidth(0.8), arrow=MidArcArrow(TeXHead));
draw(subpath(p,isections[2],isections[3]), red+linewidth(0.8), arrow=MidArcArrow(TeXHead));
draw((1/3,-1.5)--(1/3,2), gray+linewidth(0.2));
```

A more general situation is two paths intersect with each other, but not one of them is a vertial line. Function

```c++
real[] intersect(path p, path q);
```

returns an array of length 2. The first element with `[0]` gives the path time along with `p`, whereas the second element with `[1]` gives the path time along with `q`. Notice that use the function this way will only get the first intersection point. To get more, we can use function like below

```c++
real[][] a = intersections(path p, path q);
```

If the `real[][]` is called, say, `a`, then `a[0]` is an array of two real numbers, representing the path times for `p` and `q` of an intersection point. The elements in `a[]` are ordered according to which comes first on the two paths. For instance, `a[0][0]` is the path time of the first intersection of p, and `a[1][0]` is the path time of the second intersection of p. An instance showing how to use the function is laid below

```c++
settings.outformat="pdf";
unitsize(1cm);
path p = (-1,1)..(0,0)..(-1,-1);
path q = (1/2,0)..(-1/3,0)..(1/2,-1/2)..(1,0)..(-1/2,1/2);

draw(p, blue, arrow=MidArcArrow());
draw(q, green, arrow=MidArcArrow());

real[][] a = intersections(p, q);
draw(subpath(p,a[0][0], a[1][0]), red+linewidth(0.8), arrow=MidArrow(TeXHead));
```

If we are interested in the intersection point, we could use

```c++
pair intersectionpoint(path p, path q); //or
pair[] intersectionpoints(path p, path q);
```

Or just get the point from the path's path time

```c++
point(q,isections[1]);
```

## 4.6 Tangent Line

To draw a tangent line to a curve, we can simply use function

```c++
pair dir(path p, real t);
```

It returns a unit tangent vector to the path `p` at path time `t`.

```c++
settings.outformat="pdf"; 
size(3.5cm, 0); 
path p = (1/2,0) .. (-1/3,0) .. (1/2,-1/2) .. (1,0) .. (-1/2,1/2);
path l = (-1,-1) -- (1,1); 
draw(l,dashed+gray); 
draw(p, gray);

for (real[] pathtime : intersections(p,l)) { 
        real t = pathtime[0]; 
        pair tangent = dir(p, t); 
        draw(shift(point(p,t)) * scale(1/2) * ((0,0) -- tangent), 
        arrow=Arrow);
}
```

## 4.7 Disconnected Line

It is possible to draw a disconnected path a ctually an array of path--using the *pen lift* operator `^^`.

```c++
settings.outformat="pdf"; 
size(5cm,0); draw((0,0) -- (0,1) ^^ 
        (1,0) .. (3/2,1) .. (2,0) ^^ 
        (3,0) --(4,1));
```

The original `draw()` command is below

```c++
void draw(picture pic=currentpicture, 
        Label L="", 
        path g, 
        align align=NoAlign, 
        pen p=currentpen, 
        arrowbar arrow=None, 
        arrowbar bar=None, 
        margin margin=NoMargin,
        Label legend="", 
        marker marker=nomarker);

void draw(picture pic=currentpicture, 
        path[] g, 
        pen p=currentpen, 
        Label legend="", 
        marker marker=nomarker);
```

Notice that the two kinds are different in parameters.
