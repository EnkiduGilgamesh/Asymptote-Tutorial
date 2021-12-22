/*
 * File: \4_Subpath2.asy
 * Project: 4_Path
 * Created Date: Friday Dec 10th 2021, 7:26:31 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 10/12/2021 07:27:23
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
path p = (-1,1)..(0,0)..(-1,-1);
path q = (1/2,0)..(-1/3,0)..(1/2,-1/2)..(1,0)..(-1/2,1/2);

draw(p, blue, arrow=MidArcArrow());
draw(q, green, arrow=MidArcArrow());

real[][] a = intersections(p, q);
draw(subpath(p,a[0][0], a[1][0]), red+linewidth(0.8), arrow=MidArrow(TeXHead));
