# 3 Geomtry

## 3.1 Circle and Ellipse

To draw a simplest circle, we can directly use command

```c
draw(unitcircle);
```

`unitcircle` is actually a path which we will introduce later.

The function

```c
path circle(pair c, real r);
```

returns a circle centered at **c** with radius **r**.

Similar with circle, the function

```c
path ellipse(pair c, real a, real b);
```

returns an ellipse centered at **c** with horizontal diameter **2a** and vertical diameter **2b**.

## 3.2 Box and Polygon

The function

```c
path box(pair a, pair b);
```

returns a path that is rectangle of which **a** and **b** are opposite corners. 

The function

```c
path polygon(int n);
```

returns a path that is a regular polygon with **n** sides, all of whose corners lie on the unit circle.

```c
unitsize(1.5cm);
draw(unitcircle);
draw(polygon(5),blue);
```

## 3.3 Transformation

After a path is defined, we still can use transform function to change its size or position. Look at the instance below, and refer to its result to think of what they can do.

```c
size(3cm,0);
path p = box((0,0),(1,1));
draw(p,black+linewidth(2.0pt));
draw(shift(1,2)*p, blue);
draw(xscale(1.6)*p,green);
draw(yscale(1.4)*p,orange);
draw(scale(1.8)*p,red);
draw(rotate(60)*p,purple); // Rotate 60 degrees
```

Transforms can be composed with one another using `\*` operater.

```c
path p = unitcircle;
draw(p,black);
path q = shift(-2,0)*rotate(45)*(yscale(0.5)*p);
draw(q,blue);
```

## 3.4 Arcs

Below is the function creates an arc

```c
path arc(pair c, real r, real angle_1, real angle_2);
```

The arc's center is at c, and radius is r, going from angle_1 to angle_2.

```c
draw((2,1)--arc((2,1),2,60,80)--cycle);
```

Notice that if angle_1 is greater than angle_2, the arc goes clockwise, otherwise the arc goes counterclockwise.

```c
draw(arc((0,0),r=2,angle1=270,angle2=0),arrow=Arrow(TexHead),blue);
draw(arc((0,0),r=2,angle1=-90,angle2=0),arrow=Arrow(TexHead),red);
```

Another way to create arcs is to use function below

```c
path arc(pair c, explicit pair z1, explicit pair z2, 
        bool direction = CCW);
```

The arc is centered at c, starting at point z1, and ending on the line from c to z2. The direction CCW means the arc goes counterclockwise otherwise another direction CW means clockwise.

The above instance can be rewritten like below

```c
draw(arc((0,0),(0,-2),(2,0),direction=CW),arrow=Arrow(TexHead),blue);
draw(arc((0,0),(0,-2),(2,0),direction=CCW),arrow=Arrow(TexHead),red);
draw((0,0)--(3,0));
```

The arrows will go into the line instead of stopping at the edge. We can fix this issue by doing as below

```c
margin ArrowMargins = TrueMargin(linewidth,0.5 linewidth);
```

With the command above, the arrow's end will be shortened by 0.5 linewidth, whereas the beginning by the full linewidth.
