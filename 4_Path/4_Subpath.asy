/*
 * File: \4_Subpath.asy
 * Project: 4_Path
 * Created Date: Friday Dec 10th 2021, 7:02:18 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 10/12/2021 07:03:43
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


settings.outformat="pdf";
size(4cm,0);
path p = (-2,0)..(0,7/4)..(6/4,0)..(0,-5/4)..
        (-4/4,0)..(0,3/4)..(2/4,0)..(0,-1/4)..(0,0);
draw(p, arrow=ArcArrow(TeXHead,position=0.5));
real[] isections = times(p,1/3);

draw(subpath(p,isections[0],isections[1]), blue+linewidth(0.8), arrow=MidArcArrow(TeXHead));
draw(subpath(p,isections[2],isections[3]), red+linewidth(0.8), arrow=MidArcArrow(TeXHead));
draw((1/3,-1.5)--(1/3,2), gray+linewidth(0.2));
