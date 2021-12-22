# 6 Graph

- [6 Graph](#6-graph)
  - [6.1 Improving Curve](#61-improving-curve)
  - [6.2 Parametric Graphs](#62-parametric-graphs)
  - [6.3 Implicit Curve](#63-implicit-curve)

As we mentioned former, `draw` a curve is imperfact. We need to appoint a lot of points to help the curve more "life-like".

## 6.1 Improving Curve

The `graph` is a piece of code writtern for drawing functions. To use the package, we need import it in our code firstly.

```c++
settings.outformat="pdf"; 
unitsize(3cm); 
import graph; 
real f(real x) { 5
    return sqrt(x);
}
path g = graph(f,0,2);
draw(g);
```

However, nothing is perfect. To specify the number of points could improve the curve

```c++
path g = graph(f,0,2,n=200);
```

Or, giving the operator also help

```c++
path g = graph(f,0,2,operator ..);
```

The number of points and the operator can be combined. But operator `..` doesn't always work as we expect. A better option is appointing the case `Hermite`

```c++
path g = graph(f,0,2,Hermite);
```

## 6.2 Parametric Graphs

Another also important type of functions is parametric functions. We can draw below function

$$
y(t)=-4.5t^2+3t+1 \\
x(t)=1.3t
$$

like below

```c++
pair F(real t){
    return (1.3*t, -4.5*t^2+3*t+1);
}
path g = graph(F,0,0.9);
draw(g,arrow=Arrow(TeXHead));
```

Sometimes, drawing inverse function help improve the curve, too.

We can redraw the $y=\sqrt{x}$ in *4 Path* through below way

```c++
settings.outformat="pdf"; 
unitsize(2cm); 
import graph; 
real f(real x) { 
    return sqrt(x);
}
path g = graph(f,0,2, n=200);
draw(g);
```

A more complex instance is to draw the function

$$
y=\sin{\frac 1x}
$$

```c++
settings.outformat="pdf"; 
size(4cm,3cm, keepAspect=false); 
import graph; 
pair f(real t) { 
    return (1/t, sin(t));
}
draw(graph(f, 1, 10^4, n=5*10^5), thin());
draw((0,-1.1)--(0,1.3), arrow=Arrow(TeXHead));
draw((0,0)--(1.05,0), arrow=Arrow(TeXHead));
```

The `thin()` is a pen's name which shows up on a screen as being exactly one pixel thick (at every zoom level), making it possible to zoom in and see more
of the oscillations before they completely obscure one another as $x \to 0$.

## 6.3 Implicit Curve

To draw implicit curve, another moudule `contour` is needed to import. The relevant function is

```c++
guide[][] contour(real f(real,real),pair a, pair b, real[] c);
```

The function returns a `guide[][]` (i.e., an array of arrays of guides). For each `i`, the `contour_res[i]` is a guide[] representing the graph of equation $f(x,y)=c[i]$. The two pairs is the graph's two corners' coordinate. For instance, to draw the graph of $y^2=x^3-x$ like below

```c++
settings.outformat="pdf"; 
size(4cm,0); 
import contour; 
real f(real x, real y) { 
    return y^2 (x^3 - x); 
}
guide[][] thegraphs = contour(f, a=(-2,-2), b=(2,2), new real[] {0});
/* The next line draws the first (and only) entry in thegraphs. This entry is itself an array, since it represents a disconnected path. */
draw(thegraphs[0]);
```

The `new real[] {0}` builds an array containing exactly one entry, a real number `0`. We can similarly build other types of data. For example

```c++
new pair[] {(0,0),(1,0),(0,1),(0,1),(0,1)};
```

Likewise, the expression

```c++
new path[] {(0,0)--(0,1), (1,0)..(3/2,1)..(2,0), (3,0)--(4,1)}
```

is essentially equivalent to expression

```c++
(0,0)--(0,1) ^^ (1,0)..(3/2,1)..(2,0) ^^ (3,0)--(4,1)
```

Function `array.push()` will push items to the array.

```c++
int[] myarray; 
for (int i = -5; i <= 15; ++i) { 
    if (i != 0) myarray.push(i);
}
```
