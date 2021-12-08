/*
 * File: \3.3_Transform.asy
 * Project: 3_Geometry
 * Created Date: Monday Dec 6th 2021, 5:56:38 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 6/12/2021 05:57:55
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


settings.outformat="pdf";
size(3cm,0);
path p = box((0,0),(1,1));
draw(p,black+linewidth(2.0pt));
draw(shift(1,2)*p, blue);
draw(xscale(1.6)*p,green);
draw(yscale(1.4)*p,orange);
draw(scale(1.8)*p,red);
draw(rotate(60)*p,purple); // Rotate 60 degrees
