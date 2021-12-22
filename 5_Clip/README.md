# 5 Clip

Command `Clip` is to do clipping for the image which is one of the four basic commands.

It clips everthing that came before it, but not what comes afterwards. Here is an example

```c
settings.outformat="pdf";
size(2cm);
path thebox = box((0,0),(1,1));
fill(thebox,blue);
draw(shift(.5,.5)*thebox, green+linewidth(5pt));
clip(thebox);
draw(shift(-.5,-.5)*thebox, red+linewidth(5pt));
```
