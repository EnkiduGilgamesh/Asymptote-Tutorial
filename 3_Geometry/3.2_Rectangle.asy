/*
 * File: \Rectangle.asy
 * Project: Geometry
 * Created Date: Tuesday Nov 23rd 2021, 7:41:14 pm
 * Author: Wenren Muyan
 * Comments: 
 * --------------------------------------------------------------------------------
 * Last Modified: 23/11/2021 07:51:58
 * Modified By: Wenren Muyan
 * --------------------------------------------------------------------------------
 * Copyright (c) 2021 - future Wenren Muyan
 * --------------------------------------------------------------------------------
 * HISTORY:
 * Date				By				Comments
 * --------------------------------------------------------------------------------
 */


size(3cm);

draw((0,0)--(1,0)--(1,1)--(0,1)--cycle);

label("$A$", (0,0), SW);
label("$B$", (1,0), SE);
label("$C$", (1,1), NE);
label("$D$", (0,1), NW);
