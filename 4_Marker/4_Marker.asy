/*
 * File: \4_Marker.asy
 * Project: 4_Marker
 * Created Date: Wednesday Dec 8th 2021, 6:57:20 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 8/12/2021 07:02:19
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


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
